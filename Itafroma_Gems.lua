--
-- @file
-- Checks gems.
--

SlashCmdList["ITAFROMA_GEMS"] = function (msg, editbox)
    -- If there isn't a frame, there's no point in continuing.
    if not DEFAULT_CHAT_FRAME then
        return
    end

    local skill_count = GetNumTradeSkills()
    if skill_count == 0 then
        print("No skills found! Open the Jewelcrafting window before running.")
        return
    end

    local gems = {}
    gems["blue"] = {
        ["name"] = "River's Heart",
        ["color"] = {0, .47, 1},
        ["total"] = 4,
        ["known"] = 0,
    }
    gems["red"] = {
        ["name"] = "Primordial Ruby",
        ["color"] = {1, 0, 0},
        ["total"] = 5,
        ["known"] = 0,
    }
    gems["yellow"] = {
        ["name"] = "Sun's Radiance",
        ["color"] = {1, 1, 0},
        ["total"] = 5,
        ["known"] = 0,
    }
    gems["orange"] = {
        ["name"] = "Vermilion Onyx",
        ["color"] = {1, 0.5, 0},
        ["total"] = 22,
        ["known"] = 0,
    }
    gems["purple"] = {
        ["name"] = "Imperial Amethyst",
        ["color"] = {0.58, 0.51, 0.79},
        ["total"] = 14,
        ["known"] = 0,
    }
    gems["green"] = {
        ["name"] = "Wild Jade",
        ["color"] = {0, 1, 0},
        ["total"] = 18,
        ["known"] = 0,
    }
    gems["diamond"] = {
        ["name"] = "Primal Diamond",
        ["color"] = {1, 1, 1},
        ["total"] = 14,
        ["known"] = 0,
    }

    local known = 0
    for i = 1, skill_count do
        local skill_name = GetTradeSkillInfo(i) or 1
        for color, info in pairs(gems) do
            if strfind(skill_name, "%s" .. info["name"]) then
                gems[color]["known"] = gems[color]["known"] + 1
                known = known + 1
            end
        end
    end

    local total = 0
    for color, info in pairs(gems) do
        total = total + info["total"]
    end
    DEFAULT_CHAT_FRAME:AddMessage("Number of gem recipes known: " .. known .. "/" .. total)

    for color, info in pairs(gems) do
        local message = info["name"] .. ": " .. info["known"] .. "/" .. info["total"]
        DEFAULT_CHAT_FRAME:AddMessage(message, info["color"][1], info["color"][2], info["color"][3])
    end
end
SLASH_ITAFROMA_GEMS1 = '/ifgems'
