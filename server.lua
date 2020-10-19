ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function PayBills(d, h, m)
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
							})
					end
				end
			end
		end)
	end)
end

TriggerEvent('cron:runAt', 0, 0, PayBills)
TriggerEvent('cron:runAt', 1, 0, PayBills)
TriggerEvent('cron:runAt', 2, 0, PayBills)
TriggerEvent('cron:runAt', 3, 0, PayBills)
TriggerEvent('cron:runAt', 4, 0, PayBills)
TriggerEvent('cron:runAt', 5, 0, PayBills)
TriggerEvent('cron:runAt', 6, 0, PayBills)
TriggerEvent('cron:runAt', 7, 0, PayBills)
TriggerEvent('cron:runAt', 8, 0, PayBills)
TriggerEvent('cron:runAt', 9, 0, PayBills)
TriggerEvent('cron:runAt', 10, 0, PayBills)
TriggerEvent('cron:runAt', 11, 0, PayBills)
TriggerEvent('cron:runAt', 12, 0, PayBills)
TriggerEvent('cron:runAt', 13, 0, PayBills)
TriggerEvent('cron:runAt', 14, 0, PayBills)
TriggerEvent('cron:runAt', 15, 0, PayBills)
TriggerEvent('cron:runAt', 16, 0, PayBills)
TriggerEvent('cron:runAt', 17, 0, PayBills)
TriggerEvent('cron:runAt', 18, 0, PayBills)
TriggerEvent('cron:runAt', 19, 0, PayBills)
TriggerEvent('cron:runAt', 20, 0, PayBills)
TriggerEvent('cron:runAt', 21, 0, PayBills)
TriggerEvent('cron:runAt', 22, 0, PayBills)
TriggerEvent('cron:runAt', 23, 0, PayBills)
TriggerEvent('cron:runAt', 24, 0, PayBills)



