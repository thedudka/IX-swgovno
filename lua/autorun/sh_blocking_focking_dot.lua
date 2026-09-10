local original_print = print
function print(...)
    local args = {...}
    if #args == 1 and tostring(args[1]) == "." then
        return 
    end
    original_print(...)
end

local original_MsgN = MsgN
function MsgN(...)
    local args = {...}
    if #args == 1 and tostring(args[1]) == "." then
        return 
    end
    original_MsgN(...)
end

local original_Msg = Msg
function Msg(...)
    local args = {...}
    if #args == 1 and tostring(args[1]) == "." then
        return 
    end
    original_Msg(...)
end