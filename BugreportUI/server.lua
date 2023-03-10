function GetPlayerNeededIdentifiers(source)
		local ids = GetPlayerIdentifiers(source)
		for i,theIdentifier in ipairs(ids) do
			if string.find(theIdentifier,"license:") or -1 > -1 then
				license = theIdentifier
			elseif string.find(theIdentifier,"steam:") or -1 > -1 then
				steam = theIdentifier
			elseif string.find(theIdentifier,"discord:") or -1 > -1 then
				discord2 = theIdentifier
			end
		end
		if not steam then
			steam = "Not found"
		end
		if not discord2 then
			discord2 = "Not found"
		end
		return license, steam, discord2
	end


RegisterNetEvent("BugreportUI:sendReport")
AddEventHandler("BugreportUI:sendReport", function(data)

  discord = data['data'][1]
  description = data['data'][2]

	  local license, steam, discord2 = GetPlayerNeededIdentifiers(source)

if Config.displayidentifiers then
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Bug Reports",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Bug Report",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Bug Description:** ".. description .."\n**Steam:** ".. steam:gsub('steam:', '') .."\n**GameLicense:** ".. license:gsub('license:', '') .."\n**Discord UID:** ".. discord2:gsub('discord:', '') .."\n**Discord Tag:** <@!"..  discord2:gsub('discord:', '') .. ">",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("BugreportUI:reportSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Uw bugrapport is succesvol verzonden naar onze ontwikkelaars", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
else
  PerformHttpRequest(Config.discordwebhooklink, function(err, text, headers) end, 'POST', json.encode(
    {
      username = "Bug Reports",
      --avatar_url = Image,
      embeds = {
        {
          title = "New Bug Report",
          color = 16754176,
          description = "**User:** ".. GetPlayerName(source) .. " **[ID:** ".. source .."**]**\n**Bug Description:** ".. description .."",
        }
      },
    }), { ['Content-Type'] = 'application/json' })


  TriggerClientEvent("BugreportUI:reportSent", source)
  TriggerClientEvent("pNotify:SendNotification", source,{text = "Uw bugrapport is succesvol verzonden naar onze ontwikkelaars", type = "success", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
  end
end)

RegisterNetEvent("BugreportUI:emptyFields")
AddEventHandler("BugreportUI:emptyFields", function(data)
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Gelieve alle verplichte velden in te vullen", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_open", close = "gta_effects_fade_out"},killer = true})
end)

Citizen.CreateThread(function()
	if (GetCurrentResourceName() ~= "BugreportUI") then 
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named BugreportUI for it to work properly!");
	end
end)

Citizen.CreateThread(function()
    if Config.discordwebhooklink == "WEBHOOK_HERE" then
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
        print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: You need to change the webhook link in server.lua for it to work properly");
    end
end)





versionChecker = true -- Set to false to disable version checker


-- Don't touch
resourcename = "BugreportUI"
version = "1.1.0"
rawVersionLink = "https://github.com/SnowyyNL"


-- Check for version updates.
if versionChecker then
PerformHttpRequest(rawVersionLink, function(errorCode, result, headers)
    if (string.find(tostring(result), version) == nil) then
        print("\n\r[".. GetCurrentResourceName() .."] ^1WARNING: Your version of ".. resourcename .." is not up to date. Please make sure to update whenever possible.\n\r")
    else
        print("\n\r[".. GetCurrentResourceName() .."] ^2You are running the latest version of ".. resourcename ..".\n\r")
    end
end, "GET", "", "")
end
