ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
    PlayerData = ESX.GetPlayerData()
  end
end)


RegisterNetEvent('bobmarleylol')
AddEventHandler('bobmarleylol', function()
  local playerPed = GetPlayerPed(-1)
  RequestAnimSet("move_m@hipster@a")
  while not HasAnimSetLoaded("move_m@hipster@a") do
    Citizen.Wait(0)
  end
  TriggerEvent("mythic_progbar:client:progress", {
          name = "smoking_weed",
          duration = config.timetoroll,
          label = "Smoking a joint",
          useWhileDead = false,
          canCancel = true,
          controlDisables = {
              disableMovement = false,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
          },
          animation = {
              animDict = "amb@world_human_aa_smoke@male@idle_a",
              anim = "idle_a",
          },
          prop = {
              model = "prop_sh_joint_01",
          }
      }, function(status)
          if not status then
          end
      end)
  ClearPedTasksImmediately(playerPed)
  local player = PlayerId()
  AddArmourToPed(playerPed, config.addarmour)
  Wait(6000)
  exports['mythic_notify']:SendAlert('inform', 'Feeling Nice')
end)
