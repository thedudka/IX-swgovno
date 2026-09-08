local addonpath = "memetispowers/"

if SERVER then
    local function RecursionServerLoader(path)
        path = path or addonpath
        local files,folders = file.Find(path .. "*","LUA")
        if files then
            for _,v in pairs(files) do
                if string.StartWith(v, "sh_") then
                    include(path  ..  v)
                    AddCSLuaFile(path  ..  v)
                elseif string.StartWith(v, "sv_") then
                    include(path  ..  v)
                elseif string.StartWith(v, "cl_") then
                    AddCSLuaFile(path .. v)
                end
                print("[Memeti's LSCS Powers] Loaded file " .. v)
            end
        end

        if folders then
            for _,v in pairs(folders) do
                RecursionServerLoader(path .. v .. "/")
            end
        end
    end
    RecursionServerLoader()
    print("[Memeti's LSCS Powers] Serverside Loaded!")
else
    local function RecursionClientLoader(path)
        path = path or addonpath
        local files,folders = file.Find(path .. "*","LUA")
        if files then
            for _,v in pairs(files) do
                if string.StartWith(v, "sh_") or string.StartWith(v, "cl_") then
                    include(path .. v)
                end
                print("[Memeti's LSCS Powers] Loaded file " .. v)
            end
        end

        if folders then
            for _,v in pairs(folders) do
                RecursionClientLoader(path .. v .. "/")
            end
        end
    end
    RecursionClientLoader()
    print("[Memeti's LSCS Powers] Clientside Loaded!")
end