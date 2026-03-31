-- Hub Loader
-- Add scripts to the registry below. Tags: game PlaceId (as string) or "universal"

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- =============================================
-- SCRIPT REGISTRY
-- Add your scripts here.
-- "tags" = list of PlaceIds (string) and/or "universal"
-- "execute" = the raw URL to loadstring, or a function
-- =============================================
local Scripts = {
    {
        name = "Untitled Tag - Autotag",
        description = "Hitboxes, autotag, movement, ESP & more",
        tags = { "14044547200" }, -- replace with real PlaceId, or keep universal
        execute = "https://raw.githubusercontent.com/nxyystore/fwgrewf/main/script/untitled-tag/autotag.lua",
    },
    -- Add more scripts below:
    -- {
    --     name = "My Script",
    --     description = "Does cool things",
    --     tags = { "1234567890" },           -- specific game only
    --     execute = "https://pastebin.com/raw/xxxxx",
    -- },
}

-- =============================================
-- HUB LOGIC (no need to edit below this line)
-- =============================================

local currentPlaceId = tostring(game.PlaceId)

-- Filter scripts relevant to this game
local function getRelevantScripts()
    local relevant = {}
    for _, script in ipairs(Scripts) do
        for _, tag in ipairs(script.tags) do
            if tag == "universal" or tag == currentPlaceId then
                table.insert(relevant, script)
                break
            end
        end
    end
    return relevant
end

local relevantScripts = getRelevantScripts()

-- Build the window
local Window = Rayfield:CreateWindow({
    Name = "Script Hub",
    Icon = "package",
    LoadingTitle = "Script Hub",
    LoadingSubtitle = "Loading scripts for this game...",
    ShowText = "Hub",
    Theme = "Default",
    ToggleUIKeybind = "RightShift",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Info tab
local InfoTab = Window:CreateTab("Info", "info")
InfoTab:CreateSection("Game Info")

local gameNameLabel = InfoTab:CreateLabel("Game: " .. (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown"))
InfoTab:CreateLabel("Place ID: " .. currentPlaceId)
InfoTab:CreateLabel("Scripts available: " .. #relevantScripts)

if #relevantScripts == 0 then
    InfoTab:CreateLabel("⚠ No scripts found for this game.")
    Rayfield:Notify({
        Title = "No Scripts Found",
        Content = "This hub has no scripts for PlaceId: " .. currentPlaceId,
        Duration = 6,
        Image = "alert-triangle",
    })
end

-- Scripts tab
local ScriptsTab = Window:CreateTab("Scripts", "scroll-text")

if #relevantScripts > 0 then
    -- Group by universal vs game-specific
    local hasGameSpecific = false
    local hasUniversal = false

    for _, s in ipairs(relevantScripts) do
        for _, tag in ipairs(s.tags) do
            if tag == currentPlaceId then hasGameSpecific = true end
            if tag == "universal" then hasUniversal = true end
        end
    end

    if hasGameSpecific then
        ScriptsTab:CreateSection("Game Scripts")
        for _, s in ipairs(relevantScripts) do
            local isGameSpecific = false
            for _, tag in ipairs(s.tags) do
                if tag == currentPlaceId then isGameSpecific = true break end
            end
            if isGameSpecific then
                ScriptsTab:CreateButton({
                    Name = s.name,
                    Info = s.description,
                    Callback = function()
                        Rayfield:Notify({
                            Title = "Loading",
                            Content = "Executing: " .. s.name,
                            Duration = 3,
                            Image = "play",
                        })
                        task.spawn(function()
                            if type(s.execute) == "string" then
                                loadstring(game:HttpGet(s.execute))()
                            elseif type(s.execute) == "function" then
                                s.execute()
                            end
                        end)
                    end,
                })
            end
        end
    end

    if hasUniversal then
        ScriptsTab:CreateSection("Universal Scripts")
        for _, s in ipairs(relevantScripts) do
            local isUniversal = false
            for _, tag in ipairs(s.tags) do
                if tag == "universal" then isUniversal = true break end
            end
            if isUniversal then
                ScriptsTab:CreateButton({
                    Name = s.name,
                    Info = s.description,
                    Callback = function()
                        Rayfield:Notify({
                            Title = "Loading",
                            Content = "Executing: " .. s.name,
                            Duration = 3,
                            Image = "play",
                        })
                        task.spawn(function()
                            if type(s.execute) == "string" then
                                loadstring(game:HttpGet(s.execute))()
                            elseif type(s.execute) == "function" then
                                s.execute()
                            end
                        end)
                    end,
                })
            end
        end
    end
else
    ScriptsTab:CreateLabel("No scripts available for this game.")
end

Rayfield:LoadConfiguration()
