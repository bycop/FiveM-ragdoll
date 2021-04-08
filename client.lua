function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp (0, 0, 1, -1)
end

local ragdoll = false
function setRagdoll(flag)
  ragdoll = flag
end
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if ragdoll then
    	SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		DisplayHelpText("Press ~INPUT_REPLAY_SCREENSHOT~ to stop ragdoll")
    end
  end
end)

ragdol = true
RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
	if ( ragdol ) then
		setRagdoll(true)
		ragdol = false
	else
		setRagdoll(false)
		ragdol = true
	end
end)

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(100)
 		if ( IsControlPressed(2, 303) ) then  --change key here
 			TriggerEvent("Ragdoll", source)
 		end
 	end
end)

RegisterCommand("ragdoll", function(source, args, rawCommand)
	TriggerEvent("Ragdoll", source)
end)