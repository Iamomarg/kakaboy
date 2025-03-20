local hooksignalcache = {};

getgenv().hooksignal = function(signal: RBXScriptSignal, func: (...any) -> (boolean, ...any))
    if hooksignalcache[signal] then
        return error("Signal is already hooked!"); -- you can put a "signal is already hooked" error here if you want
    end

    local function connectionFunc(...)
        local offset = 1; -- because syn 3.0 started their indexes at 0. Make this 0 if you want it to start at 1
        
        for i, v in getconnections(signal) do
            v:Disable();
            if v.Function then
                if v.Function == connectionFunc then
                    offset += 1;
                else
                    local args = table.pack(func({
                        Index = i - offset,
                        Connection = v,
                        Function = v.Function
                    }, ...));
                    local fire = table.remove(args, 1);
                    if fire then
                        v:Fire(unpack(args));
                    end
                end
            end
        end
    end
    
    hooksignalcache[signal] = signal:Connect(connectionFunc);
end

getgenv().restoresignal = function(signal: RBXScriptSignal)
    local connection = hooksignalcache[signal];
    if connection then
        connection:Disconnect();
        for i, v in getconnections(signal) do
            v:Enable();
        end
        hooksignalcache[signal] = nil;
    end
end

getgenv().issignalhooked = function(signal: RBXScriptSignal)
    return hooksignalcache[signal] ~= nil;
end
