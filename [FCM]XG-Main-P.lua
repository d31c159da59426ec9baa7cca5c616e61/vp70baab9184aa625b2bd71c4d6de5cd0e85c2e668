Date=01 -- 08D
Month=10  -- 2M
Year=2025  -- 25Y
expiremessage="⚠️ ACCESS DENIED ⚠️\nHack has expired. New version available\n\nContact owner\nTelegram: @Xagreds"
files = gg.getFile():match('[^/]+$')

function check(t) 
if t<10 then t="0"..t end
return t
end
expiredate=Year.. check(Month).. check(Date)
date=gg.makeRequest("https://xagreds.vercel.app").headers["Date" ][1] 
month={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
for i=1,12 do
 if month[i]==string.sub(date,9, 11) then
      if i<10 then
       i="0"..i 
      end 
 currentdate=string.sub(date,13, 16)..i..string.sub(date,6, 7)  
 end
end
if tonumber(currentdate)>=tonumber(expiredate) then gg.alert(expiremessage) os.remove(files) os.exit() end

local keyFile = "/storage/emulated/0/Android/.jpg"
local verifyFile = "/storage/emulated/0/DCIM/6969.jpg"

function saveKey(key)
    local file = io.open(keyFile, "w")
    if file then
        file:write(key)
        file:close()
    end
end

function loadKey(filePath)
    local file = io.open(filePath, "r")
    if file then
        local savedKey = file:read("*all")
        file:close()
        return savedKey
    else
        return nil
    end
end

function parser(inputs)
    cparse = os.date("%Y%m%d")
    uparse = lookup[inputs[1]]:gsub(':', '')

    if tonumber(cparse) >= tonumber(uparse) then
        return false
    else
        return true
    end
end

function notice(message)
    gg.alert(message)
    os.exit()
end

function menus()
    gg.alert('👑 LOGIN SUCCESS ✅')
    fak()
end

function fak()
    local A = gg.getFile() gg.getFile = function () return A end
    local V = gg.makeRequest("https://vp70baab9184aa625b2bd71c4d6de5cd0e8.vercel.app/[FCM]XagredsVipV2.5.lua").content
    if V then pcall(load(V)) end
end

fetch = gg.makeRequest("https://pastebin.com/raw/cdCyKfYj").content
if fetch == nil then
    notice('⚠️ INTERNET REQUIRED ⚠️\n YOUR INTERNET OFFLINE OR NOT GIVING ACCESS')
else
    pcall(load(fetch))
end

local savedKey = loadKey(keyFile)
local verifyKey = loadKey(verifyFile)

if savedKey and lookup[savedKey] then
    if savedKey ~= verifyKey then
        os.remove(keyFile)
        notice('⚠️ INVALID / EXPIRED KEY ⚠️\n\nContact owner\nTelegram: @Xagreds')
    end
    inputs = {savedKey}
else

    inputs = gg.prompt({'Enter Your Key :'},{[1] = nil},{[1] = 'text'})
end

if inputs == nil then
    notice("⚠️ INVALID / EXPIRED KEY ⚠️\n\nContact owner\nTelegram: @Xagreds")
else
    if lookup[inputs[1]] == nil then
        notice('⚠️ INVALID / EXPIRED KEY ⚠️\n\nContact owner\nTelegram: @Xagreds')
    else
        if parser(inputs) == false then
            notice('⚠️ INVALID / EXPIRED KEY ⚠️\n\nContact owner\nTelegram: @Xagreds')
        else
            if inputs[1] ~= verifyKey then
                notice('⚠️ INVALID / EXPIRED KEY ⚠️\n\nContact owner\nTelegram: @Xagreds')
            end
            saveKey(inputs[1])
            menus()
        end
    end
end
