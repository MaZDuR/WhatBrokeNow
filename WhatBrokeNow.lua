-- DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffWhat|cffff0000Broke|cff00ccffNow|r?")

local dlls = {}
local luas = {}

function WBNOptionsLoadDefault()
    WBNOptions = WBNOptions or
    {
        IconPos = 30,   --angle of initial minimap icon position
    }
end



local function GetDLL()
    -- if table.getn(dlls) ~= 0 then return dlls
    -- else
        dlls = {} --!FIXME
        local has_superwow = SetAutoloot and true or false
        if has_superwow then table.insert(dlls, {name = "|cff009c9cSuperWow|r", version = SUPERWOW_VERSION })
        else table.insert(dlls, {name = "|cff009c9cSuperWow|r", version = "|cffff0000NONE|r" }) end

        local has_pepo_nam = pcall(GetCVar, "NP_QueueCastTimeSpells")
        if has_pepo_nam then
            local major, minor, patch=GetNampowerVersion()
            table.insert(dlls, {name = "|cff009c9cnampower|r", version = major.."."..minor.."."..patch })
        else table.insert(dlls, {name = "|cff009c9cnampower|r", version = "|cffff0000NONE|r" }) end

        local has_unitxp, timestamp = pcall(UnitXP, "version", "coffTimeDateStamp")
        if has_unitxp then table.insert(dlls, {name = "|cff009c9cUnitXP_SP3|r", version = date("%b %d %Y", timestamp) })
        else table.insert(dlls, {name = "|cff009c9cUnitXP_SP3|r", version = "|cffff0000NONE|r" }) end

        local has_interact = pcall(UnitXP, "interact", 1)
        if has_interact then table.insert(dlls, {name = "|cff009c9cInteract|r", version = "|cff00ff00YES|r" })
        else table.insert(dlls, {name = "|cff009c9cInteract|r", version = "|cffff0000?|r" }) end
    -- end
    local msg = "DLLs: "
    for i, dll in ipairs(dlls) do
        if i>1 then
            msg = msg .. ", "
        end
        msg = msg .. dll.name .. "(" .. dll.version .. ")"
    end
    DEFAULT_CHAT_FRAME:AddMessage(msg)
end

local function GetLUA()
    -- if table.getn(luas) ~= 0 and not IsShiftKeyDown() then return luas
    -- else
        luas = {} --!FIXME
        local _, class = UnitClass("player")
        
        local has_pfui = pfUI
        if has_pfui then table.insert(luas, {name="|cff33ffccpf|rUI|r", version = "|cff00ff00"..pfUI.version.string.."|r" })
        else table.insert(luas, {name="|cff33ffccpf|rUI|r", version = "|cffff0000?|r" }) end

        local has_bb = BananaFrame
        if has_bb then table.insert(luas, {name="|c000fb20aBananaBar|r", version = "|cff00ff00"..GetAddOnMetadata("BananaBar", "Version").."|r"})
        else table.insert(luas, {name="|c000fb20aBananaBar|r", version = "|cffff0000?|r" }) end
        
        local has_bigwigs = BigWigs
        if has_bigwigs then table.insert(luas, {name="|cFFFF8080BigWigs|r", version="|cff00ff00"..BigWigs.revision.."|r"})
        else table.insert(luas, {name="|cFFFF8080BigWigs|r", version="|cffff0000?|r"}) end

        local has_twt = TWTMain
        if has_twt then table.insert(luas, {name="|cffabd473TWThreat|r", version="|cff00ff00"..GetAddOnMetadata("TWThreat", "Version").."|r"})
        else table.insert(luas, {name="|cffabd473TWThreat|r", version="|cffff0000?|r"}) end

        local has_decursive = DecursiveMainBar
        if has_decursive then table.insert(luas, {name="|cFFFFAA22Decursive|r", version="|cff00ff00"..string.sub(DCR_VERSION_STRING, string.find(DCR_VERSION_STRING, "%s") + 1).."|r"})
        else table.insert(luas, {name ="|cFFFFAA22Decursive|r", version="|cffff0000?|r"}) end
        
        local has_cursive = Cursive -- getglobal(Cursive.db.profile.caption)
        if has_cursive then table.insert(luas, {name="|cffffcc00Cursive|r", version="|cff00ff00"..GetAddOnMetadata("Cursive", "Version").."|r"})
        else table.insert(luas, {name="|cffffcc00Cursive|r", version="|cffff0000?|r"}) end
        
        local has_sscan = ShaguScan
        if has_sscan then table.insert(luas, {name="|cffffcc00Shagu|cffffffffScan|r", version="|cff00ff00"..GetAddOnMetadata("ShaguScan", "Version").."|r"})
        else table.insert(luas, {name="|cffffcc00Shagu|cffffffffScan|r", version="|cffff0000?|r"}) end
        
        if class == "PALADIN"  or IsShiftKeyDown() then
            local has_pp = PallyPowerFrame
            if has_pp then table.insert(luas, {name="|cfff48CBAPallyPower|r", version="|cff00ff00"..GetAddOnMetadata("PallyPower", "Version").."|r"})
            else table.insert(luas, {name="|cfff48CBAPallyPower|r", version="|cffff0000?|r"}) end
        end

        if class == "HUNTER" or IsShiftKeyDown() then
            local has_qv = getglobal("Quiver " .. GetAddOnMetadata("Quiver", "Version"))
            if has_qv then table.insert(luas, {name="|cff00ff00Quiver|r", version="|cff00ff00"..GetAddOnMetadata("Quiver", "Version")})
            else table.insert(luas, {name="|cff00ff00Quiver|r", version="|cffff0000?|r"}) end
        end

        local has_swcl = RPLL
        if has_swcl then table.insert(luas, {name="|cFFFF8080CombatLogger|r", version="|cff00ff00"..RPLL.VERSION.."|r" })
        else table.insert(luas, {name="|cFFFF8080CombatLogger|r", version="|cffff0000?|r"}) end

        local has_rab = RABFrame
        if has_rab then table.insert(luas, {name="|cff4D80FFRABuffs|r", version="|cff00ff00"..RABuffs_Version.."|r"})
        else table.insert(luas, {name="|cff4D80FFRABuffs|r", version="|cffff0000?|r"}) end

        if IsShiftKeyDown() then
            local has_lb = ItemRollFrame
            if has_lb then table.insert(luas, {name="|cFFEDD8BBLootBlare|r", version="|cff00ff00".. GetAddOnMetadata("LootBlare", "Version").."|r"})
            else table.insert(luas, {name="|cFFEDD8BBLootBlare|r", version="|cffff0000?|r" }) end
        end
        
        if IsShiftKeyDown() then
            local has_statcompare = StatCompare_enable
            if has_statcompare then table.insert(luas, {name="|cFFDD66DDStatCompare|r", version="|cff00ff00"..GetAddOnMetadata(STATCOMPARE_ADDON_NAME, "Version").."|r"})
            else table.insert(luas, {name="|cFFDD66DDStatCompare|r", version="|cffff0000?|r"}) end
        end

        if IsShiftKeyDown() then
            local has_atlas = AtlasFrame
            if has_atlas then table.insert(luas, {name = "|cffFF8400Atlas|r", version="|cff00ff00"..ATLAS_VERSION.."|r"})
            else table.insert(luas, {name = "|cffFF8400Atlas|r", version="|cffff0000?|r"}) end
        end

        if IsShiftKeyDown() then
            local has_atlasloot = AtlasLootDefaultFrame
            if has_atlasloot then table.insert(luas, {name = "|cffFF8400AtlasLoot|r", version="|cff00ff00"..string.sub(ATLASLOOT_VERSION, string.find(ATLASLOOT_VERSION, "v") + 1).."|r"})
            else table.insert(luas, {name="|cffFF8400AtlasLoot|r", version="|cffff0000?|r"}) end
        end
    -- end
    local msg = "LUAs: "
    for i, lua in ipairs(luas) do
        if i>1 then
            msg = msg .. ", "
        end
        msg = msg .. lua.name .. "(" .. lua.version .. ")"
    end
    DEFAULT_CHAT_FRAME:AddMessage(msg)

    if AceLibrary then
        if class == "PRIEST" or class == "PALADIN" or class == "SHAMAN" or class == "DRUID" or IsShiftKeyDown() then
            if AceLibrary:HasInstance("HealComm-1.0") then DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00+HealComm-1.0|r")
            else DEFAULT_CHAT_FRAME:AddMessage("|cffff0000-Healcomm-1.0|r") end
        end

    else
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000WARNING:|r AceLibrary Not Detected!")
    end

    if not IsShiftKeyDown() then DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffW|cffff0000B|cff00ccffN|r: Hold down |cffff0000SHIFT|r to view auxiliary addons.") end
end


SLASH_WBNCMD1 = "/wbn";
function WBNCMDHandler(msg)
    msg = strlower(msg)
    if (not msg) or (strlen(msg) <= 0) or (msg == "help") then
        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r [|cff00ff00ALL|r \| |cff00ff00DLL|r \| |cff00ff00LUA|r \| |cff00ffffHELP|r]")
        DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffWhat|cffff0000Broke|cff00ccffNow|r? A simple addon to display loaded addon(s) version.")
    elseif msg == "all" then
        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r [|cff00ffffALL|r \| |cff00ff00DLL|r \| |cff00ff00LUA|r \| |cff00ff00HELP|r]")
        GetDLL()
        GetLUA()
    elseif msg == "dll" then
        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r [|cff00ff00ALL|r \| |cff00ffffDLL|r \| |cff00ff00LUA|r \| |cff00ff00HELP|r]")
        GetDLL()   
    elseif msg == "lua" then
        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r [|cff00ff00ALL|r \| |cff00ff00DLL|r \| |cff00ffffLUA|r \| |cff00ff00HELP|r]")
        GetLUA()
    else
        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r [|cff00ff00ALL|r \| |cff00ff00DLL|r \| |cff00ff00LUA|r \| |cff00ff00HELP|r]")

        DEFAULT_CHAT_FRAME:AddMessage("/|cff00ccffW|cffff0000B|cff00ccffN|r \"" .. msg.. "\" Invalid option.")
    end
end
SlashCmdList["WBNCMD"] = WBNCMDHandler

-- Frame that will listen for addon load events
local mmB = CreateFrame('Button', "WhatBrokeNowButton", Minimap)
if mmB then
    mmB:RegisterEvent("PLAYER_ENTERING_WORLD", WBNOptionsLoadDefault)
    local ddM = CreateFrame('Frame', "WhatBrokeNowDropdown", mmB, 'UIDropDownMenuTemplate')
    if ddM then 
        local function DropDownSelect(arg1)
        -- UIDropDownMenu_SetSelectedID(ddM, this:GetID())
        
        -- DEFAULT_CHAT_FRAME:AddMessage("Selected option: " .. arg1 .. " Shift?".. (IsShiftKeyDown() and "Y" or "N"))
        if arg1 == 1 then
            GetDLL()
            
            GetLUA()
            if AceLibrary then
                if class == "PRIEST" or class == "PALADIN" or class == "SHAMAN" or class == "DRUID" or IsShiftKeyDown() then
                    if AceLibrary:HasInstance("HealComm-1.0") then DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00+HealComm-1.0|r")
                    else DEFAULT_CHAT_FRAME:AddMessage("|cffff0000-Healcomm-1.0|r") end
                end
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cffff0000WARNING:|r AceLibrary Not Detected!")
            end
        elseif arg1 == 2 then
            GetDLL()
        elseif arg1 == 3 then
            GetLUA()
        elseif arg1 == 4 then
            if IsShiftKeyDown() then ReloadUI() else
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffW|cffff0000B|cff00ccffN|r: Hold down |cffff0000SHIFT|r to complete this action.")
            end     
        else

        end
        end
        UIDropDownMenu_Initialize(ddM, function()
            local info = {}
            
            info.text = "|cff00ccffALL|r Info"
            info.arg1 = 1
            info.func = DropDownSelect
            info.tooltipTitle = "ALL Information"
            info.tooltipText = "Contains general information about all loaded addons/dlls"
            UIDropDownMenu_AddButton(info)
            
            info.text = "|cff009c9cDLL|r Info"
            info.arg1 = 2
            info.func = DropDownSelect
            info.tooltipTitle = "DLL Information"
            info.tooltipText = "Contains information about Dynamic Link Libraries loaded in game."
            UIDropDownMenu_AddButton(info)

            info.text = "|cffc0c0c0LUA|r Info"
            info.arg1 = 3
            info.func = DropDownSelect
            info.tooltipTitle = "LUA Information"
            info.tooltipText = "Contains information about LUA addons loaded in the game."
            UIDropDownMenu_AddButton(info)

            info.text = "|cffff0000RELOAD UI|r"
            info.arg1 = 4
            info.func = DropDownSelect
            info.tooltipTitle = "Reload UI"
            info.tooltipText = "Reloads the user interface to apply any changes."
            UIDropDownMenu_AddButton(info)
        end)
    else
        DEFAULT_CHAT_FRAME:AddMessage("Error Making Dropdown")
    end
    mmB:SetScript("OnEvent", function()
        if WBNOptions then
            local xpos = 0
            local ypos = 0
            if WBNOptions.IconPos ~= nil then
                xpos = 80 * cos(WBNOptions.IconPos)
                ypos = 80 * sin(WBNOptions.IconPos)
            end
            mmB:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 52 - xpos, ypos - 52)
        else mmB:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 0, 0) end
    end)

    mmB.clock = GetTime()
    mmB.isMoving = false
    mmB.PoS = WBNOptions and WBNOptions.IconPos or 0
    function mmB:OnUpdate()
        if not mmB.isMoving then return end

        local xpos, ypos = GetCursorPosition()
        local xmin, ymin = Minimap:GetLeft() or 400, Minimap:GetBottom() or 400
        xpos = xmin - xpos / Minimap:GetEffectiveScale() + 70
        ypos = ypos / Minimap:GetEffectiveScale() - ymin - 70
        mmB.PoS = math.deg(math.atan2(ypos, xpos))

        xpos = 80*cos(mmB.PoS)
		ypos = 80*sin(mmB.PoS)

        mmB:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-xpos,ypos-52)
        -- mmB.clock = GetTime() + 0.2
        if WBNOptions then WBNOptions.IconPos = mmB.PoS end
    end
    mmB:SetClampedToScreen(true)
    mmB:SetMovable(true)
    mmB:EnableMouse(true)
    mmB:RegisterForClicks('LeftButtonUp', 'RightButtonUp')

    mmB:SetScript("OnEnter", function()
        GameTooltip:SetOwner(this, "ANCHOR_BOTTOMLEFT")
        GameTooltip:AddLine("|cff00ccffWhat|cffff0000Broke|cff00ccffNow|r?")
        GameTooltip:AddDoubleLine("|cff00ff00LMB|r All Addon info", "|cffff0000SHIFT|r+|cff00ff00LMB|r Move Minimap")
        GameTooltip:AddDoubleLine("|cff00ff00RMB|r Dropdown Menu", "|cffff0000SHIFT|r+|cff00ff00RMB|r Reload UI|r")
        -- GameTooltip:SetText("|cff00ccffWhat|cffff0000Broke|cff00ccffNow|r? (Click to display \"mod\" info)")
        GameTooltip:Show()
    end)
    mmB:SetScript("OnLeave", function() GameTooltip:Hide() end)
    mmB:SetScript("OnClick", function()
        if arg1 == "RightButton" and IsShiftKeyDown() then ReloadUI()
        elseif arg1 == "RightButton" and not IsShiftKeyDown() then
            if ddM then ToggleDropDownMenu(1, nil, ddM, this:GetName(), 0, 0) end
        elseif arg1 == 'LeftButton' then
            if GetTime() >= mmB.clock + 0.1 then
                mmB.clock = GetTime() + 3.0
                -- DEFAULT_CHAT_FRAME:AddMessage("Delay Test"..mmB.clock)
                GetDLL()
                GetLUA()
            end
        -- elseif arg1 == 'LeftButton' and IsShiftKeyDown() then
        end
    end)
    mmB:SetScript("OnMouseDown", function()
        -- DEFAULT_CHAT_FRAME:AddMessage("MouseDown: "..arg1)
        if arg1 == 'LeftButton' and IsShiftKeyDown() and (mmB:GetParent():GetName() == "Minimap") then
            mmB.isMoving = true
        	mmB:SetScript("OnUpdate", function() mmB:OnUpdate() end)
        end
    end)
    mmB:SetScript("OnMouseUp", function()
        -- DEFAULT_CHAT_FRAME:AddMessage("MouseUp: "..arg1)
        mmB.isMoving = false
        mmB:SetScript("OnUpdate", nil)
        --  if arg1 == 'LeftButton' and IsShiftKeyDown() then
            -- this:StopMovingOrSizing()
        -- end
    end)
    mmB:SetWidth(31)
    mmB:SetHeight(31)
    mmB:SetFrameLevel(8)
    mmB:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]])
    if WBNOptions then
        DEFAULT_CHAT_FRAME:AddMessage(WBNOptions.IconPos)
        local xpos = 0
        local ypos = 0
        if WBNOptions.IconPos ~= nil then
            xpos = 80 * cos(WBNOptions.IconPos)
            ypos = 80 * sin(WBNOptions.IconPos)
        end
        mmB:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 52 - xpos, ypos - 52)
    else mmB:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0) end
        
    mmB.overlay = mmB:CreateTexture(nil, 'OVERLAY')
    mmB.overlay:SetWidth(53)
    mmB.overlay:SetHeight(53)
    mmB.overlay:SetTexture([[Interface\Minimap\MiniMap-TrackingBorder]])
    mmB.overlay:SetPoint('TOPLEFT', 0, 0)

    mmB.icon = mmB:CreateTexture(nil, "BACKGROUND")
    mmB.icon:SetWidth(20)
    mmB.icon:SetHeight(20)
    mmB.icon:SetTexture([[Interface\Icons\INV_Misc_Gear_01]])
    mmB.icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
    mmB.icon:SetPoint('CENTER', 1, 1)
end