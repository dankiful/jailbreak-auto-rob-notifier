local webhook = ""
local query = {"exploiter", "exploits", "exploit", "exploiting", "cheater", "cheats", "cheat", "cheating", "hacker", "hacks", "hack", "hacking", "autorob"}
for i, player in pairs(game:GetService("Players"):GetPlayers()) do
    player.Chatted:Connect(function(msg)
        if table.find(query, msg) then
            local data = {
                content = "",
                embeds = {
                    {
                        title = "Account Warning!",
                        description ="⚠️ Someone in chat has possibly mentioned you cheating!",
                        color = 16771840,
                        fields = {
                          {
                            name = "`Reason`",
                            value = "Detected word in query."
                          }
                        }
                   }
               },
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
        end 
        wait(5)
    end) 
end
