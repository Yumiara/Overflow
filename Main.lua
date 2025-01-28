------------- Game Load -------------
repeat task.wait(); until game:IsLoaded()

-- UI Updater --
if isfolder and not isfolder("FlowXS") then
    makefolder("FlowXS");
end;
if isfile and not isfile("FlowXS/UIUpdater.lua") then
    if isfile("FlowXS/UI_P.lua") then
        delfile("FlowXS/UI_P.lua")
        writefile("FlowXS/UIUpdater.lua", "Verified by TTJY")
    else
        writefile("FlowXS/UIUpdater.lua", "Verified by TTJY")
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

if game.GameId == 5750914919 and game:GetService("ReplicatedStorage"):FindFirstChild("GameAnalyticsError") then
    --game:GetService("ReplicatedStorage").GameAnalyticsError:Destroy(true);
    --game:GetService("ReplicatedStorage").GameAnalyticsError.Name = "!2\n!\n?Protectec?Flow?By?\n+%\n*-Software\tSpecial"
end;

------------- Varaibles/Functions -------------
local GG = (getgenv and getgenv()) or _G or shared;
GG.HttpsSer = game.GetService(game, 'HttpService');

task.spawn(function()
    while true do
        GG.ItemList = {"Windset Totem","Tidebreaker","Blizzard Totem","Magic Thread","Tempest Totem","Ancient Thread","Heart Of Zeus","Flippers","Lunar Thread","Aurora Totem","Basic Diving Gear","Beginner Oxygen Tank","Witches Ingredient","Firework","Water Bubble","Avalanche Totem","Conception Conch","Glider","Zeus Storm Totem","Advanced Oxygen Tank","Winter Cloak","Super Flippers","Advanced Diving Gear","Crab Cage","Skin Crate","Bag of Presents","Elite Token","Regular Token","Treasure Map","Poseidon Wrath Totem","TNT","Handwritten Note","Fillionaire","Nuke","GPS","Meteor Totem","Pickaxe","Sundial Totem","Intermediate Oxygen Tank","Advanced Glider","Fish Radar","Basic Oxygen Tank","Eclipse Totem","Smokescreen Totem"};
        GG.TotemList = {"Windset Totem","Blizzard Totem","Tempest Totem","Aurora Totem","Avalanche Totem","Zeus Storm Totem","Poseidon Wrath Totem","Meteor Totem","Sundial Totem","Eclipse Totem","Smokescreen Totem"};
        task.wait(4);
    end;
end);

function getfolder(obj)
    if isfolder then
        return (obj and isfolder(obj)) or true;
    else
        return false;
    end;
end;
function EnCodeJ(obj)
    return (GG.HttpsSer):JSONEncode(obj)
end;
function DeCodeJ(obj)
    return (GG.HttpsSer):JSONDecode(obj)
end;

GG.ALLVersion = ((readfile and isfile) and (isfile("FlowXSVersion.json") and readfile("FlowXSVersion.json")) and DeCodeJ(readfile("FlowXSVersion.json"))) or {["MagicCity"] = true}
if GG.ALLVersion["MainLoader"] == nil then
    GG.ALLVersion["MainLoader"] = tostring(tick());
end;

------------- Source Loader -------------
srcName = "https://raw.githubusercontent.com/Yumiara/Overflow/refs/heads/main/API_P"
if tick() - tonumber(GG.ALLVersion["MainLoader"]) >= 600 then
    if writefile then
        SourceXS = game.HttpGet(game, srcName);
        writefile("FlowXS/API_P.lua", SourceXS);
        GG.ALLVersion["MainLoader"] = tostring(tick());
        ContentsXSV = EnCodeJ(GG.ALLVersion);
        writefile("FlowXSVersion.json", ContentsXSV);
        warn("[Flow] : Loaded API_P from github via auto update");
        loadstring(SourceXS)();
    else
        game.GetService(game, "Players").LocalPlayer:Kick("writefile failed, try rejoin before report bug");
    end;
else
    if getfolder then
        if not getfolder("FlowXS") then
            makefolder("FlowXS")
        end; 
        repeat task.wait(0.7); until getfolder("FlowXS")
        if getfolder("FlowXS") then
            APISource = isfile("FlowXS/API_P.lua") and readfile("FlowXS/API_P.lua")
            if not APISource or not isfile("FlowXSVersion.json") then
                if writefile then
                    SourceXS = game.HttpGet(game, srcName)
                    writefile("FlowXS/API_P.lua", SourceXS);
                    GG.ALLVersion["MainLoader"] = tostring(tick());
                    ContentsXSV = EnCodeJ(GG.ALLVersion);
                    writefile("FlowXSVersion.json", ContentsXSV);
                    warn("[Flow] : Loaded API_P from github");
                    for i=1, 3 do
                        local OneRunC, OneRunE = pcall(function()
                            loadstring(SourceXS)();
                        end);
                        if OneRunC then break; end;
                        task.wait(2);
                    end;
                else
                    game.GetService(game, "Players").LocalPlayer:Kick("writefile failed, try rejoin before report bug");
                end;
            else
                warn("[Flow] : Loaded API_P from device and NOT github");
                for i=1, 3 do
                    local OneRunC, OneRunE = pcall(function()
                        loadstring(APISource)();
                    end);
                    if OneRunC then break; end;
                    task.wait(2);
                end
            end;
        else
            game.GetService(game, "Players").LocalPlayer:Kick("isfolder obj failed, try rejoin before report bug");
        end;
    else
        game.GetService(game, "Players").LocalPlayer:Kick("isfolder failed, try rejoin before report bug");
    end;
end;


--[[
if game:GetService("CoreGui"):FindFirstChild("Debug") then game:GetService("CoreGui")["Debug"]:Destroy(); end;
GG["Module"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/DebugLibraryUIX/main/Library.lua"))(); game:GetService("CoreGui"):WaitForChild("Debug").Enabled = false; GG["Module"]["Acrylic"].new(game:GetService("CoreGui"):WaitForChild("Debug"):WaitForChild("Frame")); GG["Module"]["Debug"]("Welcome", "Secret"); wait(1);
--]]
