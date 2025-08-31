
if gg.isVisible(false) 
then 
gg.setVisible(true)
end

XG = 1
function XGmain()
gg.alert("⚠️ WARNING ⚠️\n\nGENERATE THE KEY ONLY USE ONE-TIME\nIF MAKE GENERATE MULTIPLE TIME UR KEY WILL BE INVALID\n\n\n\n✉️SEND YOUR KEY TO OWNER\n\n Telegram: @Xagreds\n")
gg.clearResults()
gg.clearList()
mXGmain = gg.choice({ 
'GENERATE KEY',
'COPY KEY',
'EXIT 🚪'
}, nil, 'Created by : @Xagreds\n█▒░[ ' .. os.date("%A %x | %X") .. ' ]░▒█')
if mXGmain == 1 then
gen()
elseif mXGmain == 2 then 
cop()
elseif mXGmain == 3 then 
exit()
end
XG=-1
end

function generateRandomSHA512()
math.randomseed(os.time())
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = {}
    for i = 1, math.random(32,42) do
        local rand = math.random(1, #charset)
        result[i] = charset:sub(rand, rand)
    end
    return table.concat(result)
end
math.randomseed(os.time())
local rkey = generateRandomSHA512()

function gen()
local path = "/storage/emulated/0/DCIM/"
local filePath = path .. "6969.jpg"

local file = io.open(filePath, "r")
if file then
local content = file:read("*a")
    file:close()
    local choice = gg.choice({
    "✅ Generate New Key",
    "❌ Keep Existing Key"}, nil, "A key already exists. Do you want to replace it?")
    if choice ~= 1 then
        gg.setVisible(true)
        gg.alert("✅ Keeping existing key.\nKey copied to clipboard!\n\nYour key : " .. content .. "\n\n\n✉️SEND YOUR KEY TO OWNER\n\n Telegram: @Xagreds\n", "COPY")
        gg.copyText(content)
        os.exit()
        return
    end
end

file = io.open(filePath, "w")
if file then
    file:write(rkey)
    file:close()
    gg.alert("Your key : " .. rkey .. "\n\n\n✉️SEND YOUR KEY TO OWNER\n\n Telegram: @Xagreds\n", "COPY")
    gg.copyText(rkey)
else
    gg.alert("❌ ERROR")
end

XGmain()
end

function cop()
    local path = "/storage/emulated/0/DCIM/"
    local filePath = path .. "6969.jpg"
    
    local file = io.open(filePath, "r")
    if file then
        local content = file:read("*a")
        file:close()
        if content and content ~= "" then
            gg.setVisible(true)
            gg.alert("✅ Key copied to clipboard!\n\nYour key : " .. content .. "\n\n\n✉️SEND YOUR KEY TO OWNER\n\n Telegram: @Xagreds\n", "COPY")
            gg.copyText(content)
            os.exit()
        else
            gg.alert("❌ ERROR")
            os.exit()
        end
    else
        gg.alert("❌ ERROR")
        os.exit()
    end
    
    XGmain()
end

function exit()
gg.clearList()
gg.clearResults()
gg.setVisible(true)
gg.alert("✉️SEND YOUR KEY TO OWNER\n\n Telegram: @Xagreds\n")
os.exit()
end



while true do
if gg.isVisible(true) then
XG = 1
gg.setVisible(false)
end
if XG == 1 then
XGmain()
end
end