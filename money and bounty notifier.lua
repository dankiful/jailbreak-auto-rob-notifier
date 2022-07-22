_G.Sendhook = true -- to change this to false, open a new tab in synapse and just change the true to false
_G.HookTimer = 900 -- 15 minutes
-- just use google's minute's to seconds converter, or hour idc all works the same

while _G.Sendhook do
    local webhook = "your webhook here"
    local bountytext = game:GetService("Players").LocalPlayer.PlayerGui.AppUI.Buttons.Bounty.Label.Text
    local currentcash = game:GetService("Players").LocalPlayer.PlayerGui.CashGui.Container.Content.ContainerTop.ContainerRight.ContainerCash.TextLabel.Text
    local data = {
        ["content"] = "",
        ["embeds"] = {
            {
                ["title"] = "Jailbreak Auto-Rob ".. _G.HookTimer.. " Second Notifier.",
               ["description"] = "💸 Your current cash: `".. currentcash .."`\n💢 Your current bounty: `".. string.sub(bountytext,9) .."`",
               ["url"] = "https://www.roblox.com/games/606849621/Jailbreak",
               ["type"] = "rich",
               ["color"] = tonumber(0x00ccff),
               ["footer"] = {
                ["text"] = "You will receive another ping in " .. _G.HookTimer .. " seconds. | Made by Blind#2665"
               }
           }
       }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
    ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or syn.request
    local webhook_data = {Url = webhook, Body = newdata, Method = "POST", Headers = headers}
    request(webhook_data)
    wait(900)
end
