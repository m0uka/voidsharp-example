VoidSharpTestLoader = VoidSharpTestLoader or {}

VoidSharpTestLoader.Directory = "voidsharptest"
VoidSharpTestLoader.EntryNamespace = "VoidSharpTest"

VoidSharpTestLoader.IsLoaded = false

VoidSharpTestAutoRefresh = false
VoidSharpTestAutoRefreshFunc = function ()
    if (VoidSharpTestAutoRefresh) then
        timer.Simple(0, function ()
            VoidSharpTest.Program.HandleAutoRefresh()
        end)
    else
        timer.Simple(0.5, function ()
            VoidSharpTestAutoRefresh = true
        end)
    end
end

local function loadLog(msg, err)
    local strAppend = err and "[ERROR]" or ""
    MsgC(err and Color(192, 57, 43) or Color(87, 180, 242), "[VoidSharpTest] [Loader] " .. strAppend, Color(255, 255, 255), msg, "\n")
end

local function includeFileVC2(str)
    include(str)
end

VoidSharpTestLoader.AutoRefresh = function ()
    VoidSharp.Loader.Launcher(VoidSharpTestLoader.Directory, VoidSharpTestLoader.EntryNamespace, includeFileVC2)
end

loadLog("Initializing...")

if (!VoidSharp) then
    loadLog("VoidSharp is not ready, waiting for hook...")

    hook.Add("VoidSharp.Loader.Loaded", "VoidSharpTestLoader.Loader.WaitForVoidSharp", function (launcher)
        loadLog("VoidSharp hook called, loading!")
        launcher(VoidSharpTestLoader.Directory, VoidSharpTestLoader.EntryNamespace, includeFileVC2)
        VoidSharpTestLoader.IsLoaded = true
    end)

    hook.Add("Initialize", "VoidSharpTestLoader.IsLoaded", function ()
        if (!VoidSharp) then
            loadLog("VoidSharp is not installed! You need to install it before installing VoidSharpTest!", true)
        end
    end)
else
    loadLog("VoidSharp is ready, loading!")
    VoidSharp.Loader.Launcher(VoidSharpTestLoader.Directory, VoidSharpTestLoader.EntryNamespace, includeFileVC2)

    VoidSharpTestLoader.IsLoaded = true
end