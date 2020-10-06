ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

CreateThread(function()
		Wait(0)
		MySQL.Async.fetchAll('SELECT * FROM billing', {}, function (result)
			print(#result)
			for i=1, #result, 1 do
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)
				
				-- message player if connected
				if xPlayer then
				  if result[i].amount > 0 then
					local accountMoney = xPlayer.getAccount('bank').money
				
							xPlayer.removeAccountMoney('bank', result[i].amount)
							TriggerClientEvent('esx:showNotification', xPlayer.source, "強制自動繳款嘍")
							TriggerEvent('esx_addonaccount:getSharedAccount', result[i].target, function(account)
								account.addMoney(result[i].amount)
							end)
							MySQL.Sync.execute('DELETE FROM billing WHERE id = @id',
							{
								['@id'] = result[i].id
							}
						end)
					end
				end
			end
		end)
	end)
