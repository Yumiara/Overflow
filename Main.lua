------------- Game Load -------------
repeat task.wait(); until game:IsLoaded();

------------- Super Global -------------

GG = (getgenv and getgenv()) or _G or shared or false;
GG.GG = GG;

if not GG then
    game:GetService("Players"):Kick("GG not found. Please report this bug in discord server and tell us your executor.");
end;

if not GG.AlreadyLoadMain then
    for i=1, 3 do
        
        local GlobalOneRunCall, GlobalOneRunError = pcall(function()
            GG.setc = setclipboard or toclipboard;
            GG.tos = tostring;
            GG.ton = tonumber;
            GG.tablein = table.insert;
            GG.tablecl = table.clear;
            GG.tablef = table.find;
            GG.print = print;
            GG.tk = task;
            GG.tspawn = tk.spawn;
            GG.twait = tk.wait;
            GG.tdelay = task.delay;
            GG.wait = wait;
            GG.Vec3 = Vector3.new;
            GG.CF = CFrame.new;
            GG.str = string;
            GG.strgsub = str.gsub;
            GG.strsub = str.sub;
            GG.strfind = str.find;
            GG.strlen = str.len;
            GG.pir = pairs;
            GG.pcal = pcall;
            GG.Instancen = Instance.new;
            GG.tick = tick;
            GG.delay = delay;
            GG.mfloor = math.floor;
            GG.tabler = table.remove;
            GG.fromRGB = Color3.fromRGB;
            GG.ipairs = ipairs;

            GG.IsA = function(a,b)
                return a:IsA(b);
            end;

            GG.GetAttribute = function(a,b)
                return a:GetAttribute(b);
            end;
            GG.SetAttribute = function(a,b,c)
                a:SetAttribute(b,c)
            end;

            GG.FindFirstChild = function(a,b,c)
                return a:FindFirstChild(b,c or nil);
            end;
            GG.FindFirstChildOfClass = function(a,b)
                return a:FindFirstChildOfClass(b);
            end;
            GG.FindFirstChildWhichIsA = function(a,b,c)
                return a:FindFirstChildWhichIsA(b,c or nil);
            end;

            GG.GetService = function(a)
                return game:GetService(a);
            end;

            GG.GetChildren = function(a)
                return a:GetChildren();
            end;

            GG.GetDescendants = function(a)
                return a:GetDescendants();
            end;

            GG.WaitForChild = function(a,b)
                return a:WaitForChild(b);
            end;

            tempwait = GG.twait;
            GG.twait = function(time)
                if time and time > 0 then
                    tempwait(time);
                else
                    if time == nil then
                        tempwait(time);
                    end;
                    return 0;
                end;
            end;

            GG.VirtualInputManager = GetService('VirtualInputManager');
            GG.VU = GetService("VirtualUser");
            GG.T = GetService("TeleportService");
            GG.HttpService = GetService("HttpService");
            GG.W = GetService("Workspace");
            GG.P = GetService("Players");
            GG.L = GetService("Lighting");
            GG.C = GetService("CoreGui");
            GG.StarterGui = GetService("StarterGui");
            GG.H = GetService("RunService");
            GG.R = GetService("ReplicatedStorage");
            GG.TweenService = GetService("TweenService");
            GG.Cam = WaitForChild(W, "Camera");
            GG.selff = P.LocalPlayer;
            GG.Backpack = selff.Backpack;
            GG.PSG = WaitForChild(selff, "PlayerGui");
            GG.CollectionService = GetService("CollectionService");
            GG.selc = selff.Character;

            GG.cmdm = selff:GetMouse();

            GG.Kick = function(a)
                return selff:Kick(tos(a));
            end;

            GG.Tp2 = function(a)
                selff.Character.HumanoidRootPart.CFrame = a;
                return true;
            end;

            GG.BlackExec = false;

            local Iden=nil; 
            pcal(function() 
                Iden = identifyexecutor();
            end);

            IdentifyList = {
                "Solara";
                "Real";
                "Private__Win0";
            };

            if tablef(IdentifyList, Iden) then
                BlackExec = true;
            end;
            if strfind(Iden, "Xeno") then
                BlackExec = true;
            end;

            GG.GameId = game.GameId;
            GG.PlaceId = game.PlaceId;

            GG.Destroy = function(a)
                return a:Destroy(true);
            end;

            GG.EnCodeJ = function(obj)
                return HttpService:JSONEncode(obj);
            end;
            GG.DeCodeJ = function(obj)
                return HttpService:JSONDecode(obj);
            end;

            GG.HttpGet = function(url, a)
                return game:HttpGet(url, a or nil);
            end;

            GG.loadsource = function(source)
                for i=1, 3 do
                    local OneRunC, OneRunE = pcal(function()
                        loadstring(source)();
                    end);
                    if OneRunC then
                        break; 
                    end;
                    twait(2);
                end;
            end;

            GG.setfps = function(a)
                return setfpscap(ton(a));
            end;

            GG.SetCore = function(a,b,c)
                StarterGui:SetCore("SendNotification", {Title = a,
                    Text = b,
                    Duration = c
                });
            end;

        end);

        if GlobalOneRunCall then
            GG.AlreadyLoadMain = true;
            break;
        else
            if i == 3 then
                game:GetService("Players"):Kick("Please report this bug to discord server and provide your executor. : " .. GlobalOneRunError);
            end;
        end;
    end;
end;

------------- UI Updater -------------

if not isfolder or not isfile or not makefolder or not writefile or not readfile then
    Kick("Your executor doesn't support file system.");
end;

if not isfolder("FlowXS") then
    makefolder("FlowXS");
end;
if not isfile("FlowXS/UIUpdater.lua") then
    if isfile("FlowXS/UI_P.lua") then
        delfile("FlowXS/UI_P.lua");
        writefile("FlowXS/UIUpdater.lua", "Verified by TTJY");
    else
        writefile("FlowXS/UIUpdater.lua", "Verified by TTJY");
    end;
end;

------------- Bypasser -------------

--[[
RequestBypasFailed = {}; RequestBypasSuccess = {};
pcall(function()
    local A, B = pcall(function() local OldNamecall; OldNamecall = hookmetamethod(game, "__namecall", function(self, ...) if getnamecallmethod() == "FireServer" then if tostring(self) == "Sender2" or tostring(self) == "Sender" then return wait(9e9); end; end; return OldNamecall(self, ...); end); end);
    if not A then table.insert(RequestBypasFailed, tostring(B));
    elseif A then table.insert(RequestBypasSuccess, "Yeah I was here"); end;
end);
pcall(function() if isfunctionhooked(clonefunction(request)) then while true do end; end; end); VerifiedGame = false;
pcall(function()
    local RunService = game:GetService("RunService"); local frameCount = 0; local startTime = tick();
    local lastTime = tick(); local connection;
    connection = RunService.RenderStepped:Connect(function() frameCount = frameCount + 1; local currentTime = tick(); local deltaTime = currentTime - lastTime; local elapsedTime = currentTime - startTime; if deltaTime >= 1 then local fps = frameCount / deltaTime; frameCount = 0; lastTime = currentTime; if fps > 40 or elapsedTime > 20 then connection:Disconnect(); connection = nil; end; end; end);
    repeat task.wait(); until connection == nil
end); task.wait();

--]]

if GameId == 5750914919 and FindFirstChild(R, "GameAnalyticsError") then
    --R.GameAnalyticsError.Name = "!2\n!\n?Protectec?Flow?By?\n+%\n*-Software\tSpecial";
end;

------------- Varaibles/Functions -------------
GG.ALLVersion = (isfile("FlowXSVersion.json") and readfile("FlowXSVersion.json")) and DeCodeJ(readfile("FlowXSVersion.json")) or {["MagicCity"] = true};
if ALLVersion["MainLoader"] == nil then
    ALLVersion["MainLoader"] = tos(tick());
end;

------------- Source Loader -------------
srcName = "https://raw.githubusercontent.com/Yumiara/Overflow/refs/heads/main/API_P";
if tick() - ton(ALLVersion["MainLoader"]) >= 600 then
    SourceXS = HttpGet(srcName);
    writefile("FlowXS/API_P.lua", SourceXS);

    ALLVersion["MainLoader"] = tos(tick());

    ContentsXSV = EnCodeJ(ALLVersion);

    writefile("FlowXSVersion.json", ContentsXSV);
    warn("[Flow] : Loaded API_P from github via auto update");

    loadstring(SourceXS)();
else
    if isfolder("FlowXS") then
        APISource = isfile("FlowXS/API_P.lua") and readfile("FlowXS/API_P.lua");

        if not APISource or not isfile("FlowXSVersion.json") then
            SourceXS = HttpGet(srcName);
            writefile("FlowXS/API_P.lua", SourceXS);

            ALLVersion["MainLoader"] = tos(tick());
            ContentsXSV = EnCodeJ(ALLVersion);

            writefile("FlowXSVersion.json", ContentsXSV);
            warn("[Flow] : Loaded API_P from github");

            loadsource(SourceXS);
        else
            warn("[Flow] : Loaded API_P from device and NOT github");

            loadsource(APISource);
        end;
    else
        Kick("isfolder obj failed, try rejoin before report bug");
    end;
end;


--[[
if game:GetService("CoreGui"):FindFirstChild("Debug") then game:GetService("CoreGui")["Debug"]:Destroy(); end;
GG["Module"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/DebugLibraryUIX/main/Library.lua"))(); game:GetService("CoreGui"):WaitForChild("Debug").Enabled = false; GG["Module"]["Acrylic"].new(game:GetService("CoreGui"):WaitForChild("Debug"):WaitForChild("Frame")); GG["Module"]["Debug"]("Welcome", "Secret"); wait(1);
--]]
