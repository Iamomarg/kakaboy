--if not game:IsLoaded() then game.Loaded:Wait() end

local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

getgenv().secretfunc = function(func)
	if func == nil then
		game.Players.LocalPlayer:Kick("not available right now!")
		error("kaka!")
	else
		local result = func()

		if result == "TQeOrEwcbs" then
			
		else
			game.Players.LocalPlayer:Kick("Lil bro ur api version is outdated go and update it")
			error("Outdated Error")
		end
	end
end

secretfunc(JXlxyAaAYA)

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
getgenv().debug = testdebug

getgenv().setthreadidentity = function(identity: number): ()
    _setidentity(identity)
    task.wait()
end

getgenv().setidentity = getgenv().setthreadidentity
getgenv().setthreadcontext = getgenv().setthreadidentity

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

getgenv().getconnection = newcclosure(function(signal, index)
    local connections = getconnections(signal)
    if index > 0 and index <= #connections then
        return connections[index]
    else
        return nil
    end
end)

getgenv().getactors = newcclosure(function()
    local actors = {};
    for i, v in game:GetDescendants() do
        if v:IsA("Actor") then
            table.insert(actors, v);
        end
    end
    return actors;
end);

setreadonly(getgenv().debug,false)
getgenv().debug.traceback = initgetrenv().debug.traceback
getgenv().debug.profilebegin = initgetrenv().debug.profilebegin
getgenv().debug.profileend = initgetrenv().debug.profileend
getgenv().debug.getmetatable = getgenv().getrawmetatable
getgenv().debug.setmetatable = getgenv().setrawmetatable
getgenv().debug.info = initgetrenv().debug.info

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

--[[
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
]]

getgenv().getscriptfunction = getgenv().getscriptclosure

local oldreq = clonefunction(initgetrenv().require)
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

loadstring(game:HttpGet("https://raw.githubusercontent.com/Iamomarg/kakaboy/refs/heads/main/sigma.luau"))()

NotificationLibrary:SendNotification("Success", "[PSWalloz] -> Loaded succesfully", 5)

task.spawn(function()
    while true do
        wait(5)
        if identifyexecutor() ~= "Ventures" or getexecutorname() ~= "Ventures" then
            game.Players.LocalPlayer:Kick("stop skidding lil bro")
            error("skidder alert")
            break
        end
    end
end)

loadautoexecutor()
