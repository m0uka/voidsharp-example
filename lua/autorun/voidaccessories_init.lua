VoidAccessoriesLoader = VoidAccessoriesLoader or {}

VoidAccessoriesLoader.Directory = "voidaccessories"
VoidAccessoriesLoader.EntryNamespace = "VoidAccessories"

VoidAccessoriesLoader.IsLoaded = false

VoidAccessoriesAutoRefresh = false
VoidAccessoriesAutoRefreshFunc = function ()
    if (VoidAccessoriesAutoRefresh) then
        timer.Simple(0, function ()
            VoidAccessories.Program.HandleAutoRefresh()
        end)
    else
        timer.Simple(0.5, function ()
            VoidAccessoriesAutoRefresh = true
        end)
    end
end

local function loadLog(msg, err)
    local strAppend = err and "[ERROR]" or ""
    MsgC(err and Color(192, 57, 43) or Color(87, 180, 242), "[VoidAccessories] [Loader] " .. strAppend, Color(255, 255, 255), msg, "\n")
end

local function includeFileVC2(str)
    include(str)
end

VoidAccessoriesLoader.AutoRefresh = function ()
    VoidSharp.Loader.Launcher(VoidAccessoriesLoader.Directory, VoidAccessoriesLoader.EntryNamespace, includeFileVC2)
end

loadLog("Initializing...")

if (!VoidSharp) then
    loadLog("VoidSharp is not ready, waiting for hook...")

    hook.Add("VoidSharp.Loader.Loaded", "VoidAccessoriesLoader.Loader.WaitForVoidSharp", function (launcher)
        loadLog("VoidSharp hook called, loading!")
        launcher(VoidAccessoriesLoader.Directory, VoidAccessoriesLoader.EntryNamespace, includeFileVC2)
        VoidAccessoriesLoader.IsLoaded = true
    end)

    hook.Add("Initialize", "VoidAccessoriesLoader.IsLoaded", function ()
        if (!VoidSharp) then
            loadLog("VoidSharp is not installed! You need to install it before installing VoidAccessories!", true)
        end
    end)
else
    loadLog("VoidSharp is ready, loading!")
    VoidSharp.Loader.Launcher(VoidAccessoriesLoader.Directory, VoidAccessoriesLoader.EntryNamespace, includeFileVC2)

    VoidAccessoriesLoader.IsLoaded = true
end