_G.Sendhook = true -- to change this to false, open a new tab in synapse and just change the true to false
_G.HookTimer = 900 -- 15 minutes
-- just use google's minute's to seconds converter, or hour idc all works the same

local funny_table = {
    "-- -.-- / -. ..- - ... / .. - -.-. ....",
    ".... .. / -- --- -- -.-.--",
    ".-- .... .- - / -.. --- / .. / .--. ..- - / .... . .-. .",
    "-... .. --. / -... .-.. .- -.-. -.- / -... .- .-.. .-.. ..."
}

while _G.Sendhook do
    local webhook = "your webhook here"
    local bountytext = game:GetService("Players").LocalPlayer.PlayerGui.AppUI.Buttons.Bounty.Label.Text
    local currentcash = game:GetService("Players").LocalPlayer.PlayerGui.CashGui.Container.Content.ContainerTop.ContainerRight.ContainerCash.TextLabel.Text
    -- string.sub(bountytext,9)
    local data = {
        content = "",
        embeds = {
            {
                title = "Jailbreak Auto-Rob ".. _G.HookTimer.. " Second Notifier.",
                fields = { -- thank to Cynical#0019 for re-design idea
                    {
                        name = "`💸` Current Cash",
                        value = "```".. currentcash.. "```",
                        inline = true
                    },
                    {
                        name = "`💢` Current Bounty",
                        value = "```".. string.sub(bountytext,9) .. "```",
                        inline = true
                    },
                },
                url = "https://www.roblox.com/games/606849621/Jailbreak",
                color = tonumber(0x00ccff),
                footer = {
                    text = "\"We got them same guns they send off to Russia\" - Gucci Mane."
               }
           }
       },
       username = funny_table[math.random( #funny_table )],
       avatar_url = "https://cdn.discordapp.com/attachments/995764976369279127/999846528468394004/7708-yb-angry2.png?size=4096",
       attachments = {}
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
