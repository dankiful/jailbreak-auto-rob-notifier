--[[
    Credits:
        fayy#9999 - Base
        Blind#2665 - Added more features
        HKPlays#4587 - Helped add some features
]]--

_G.Sendhook = true
_G.HookTimer = 900 -- 15 minutes

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
    local currenTeam = tostring(game:GetService("Players").LocalPlayer.Team)
    local currentLevel = tostring(game:GetService("Players").LocalPlayer.Level.Value)
    local currentEXP = tostring(game:GetService("Players").LocalPlayer.Exp.Value)
    local lplr_name = game:GetService("Players").LocalPlayer.Name
    local data = {
        content = "",
        embeds = {
            {
                title = "Jailbreak Auto-Rob Notifier.",
                description = "Current logged in user: `".. lplr_name .. "`",
                fields = {
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
                    {
                        name = "`🎭` Current Team",
                        value = "```".. currenTeam .. "```",
                        inline = true
                    },
                    {
                        name = "`🆙` Current Level & EXP",
                        value = "```".. currentLevel .. " (".. currentEXP .. ")```",
                        inline = true
                    },
                },
                url = "https://www.roblox.com/games/606849621/Jailbreak",
                color = nil,
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
    require(game:GetService("ReplicatedStorage").Game.Notification).new({
        Text = "Sent Webhook, check your discord!\nBlind#2665, fayy#9999 & HKPlays#4587",
        Duration = 10
    })
    wait(_G.HookTimer)
end
