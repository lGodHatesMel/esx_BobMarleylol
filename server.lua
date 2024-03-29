ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

local alreadyrolling = false

ESX.RegisterUsableItem('weed', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local rollingpaper = xPlayer.getInventoryItem('rollingpaper').count
  local joints = xPlayer.getInventoryItem('joint').count
  if rollingpaper >= config.rollingpaper and joints < config.maxjoints and not alreadyrolling then
    alreadyrolling = true
    TriggerClientEvent("pNotify:SendNotification", _source, {
      text = "Rolling a joint",
      type = "success",
      queue = "lmao",
      timeout = config.timetoroll,
      layout = "bottomCenter"})
      Wait(config.rollingtime)
      alreadyrolling = false
      xPlayer.removeInventoryItem('weed', config.weed)
      xPlayer.removeInventoryItem('rollingpaper', config.rollingpaper)
      xPlayer.addInventoryItem('joint', config.jointamount)
    elseif rollingpaper < config.rollingpaper then
      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'You have no papers' })
    elseif alreadyrolling then
      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'You are already rolling a joint' })
    end
end)

ESX.RegisterUsableItem('joint', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local lighter = xPlayer.getInventoryItem('lighter').count
    if lighter < 1 then
      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'A lighter is needed to smoke a joint' })
    else
      xPlayer.removeInventoryItem('joint', 1)
      TriggerClientEvent('bobmarleylol', source)
    end
end)
