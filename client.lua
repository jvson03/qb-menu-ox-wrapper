print("^3[qb-menu-wrapper]^0 Loaded. Using ^2ox_lib^0 under the hood.")

-- Convert legacy qb-menu format to ox_lib context menu
local function convertLegacyMenu(elements)
    local converted = {}

    for _, item in ipairs(elements) do
        if item.isMenuHeader then
            table.insert(converted, {
                title = item.header or "Header",
                description = item.txt or nil,
                icon = "fas fa-bars",
                disabled = true
            })
        elseif item.header then
            table.insert(converted, {
                title = item.header,
                description = item.txt or nil,
                icon = item.icon or nil,
                onSelect = function()
                    local params = item.params or {}
                    if params.event then
                        TriggerEvent(params.event, params.args or {})
                    elseif item.event then
                        TriggerEvent(item.event, item.args or {})
                    end
                end
            })
        end
    end

    return converted
end

-- Main entry point for openMenu export
exports('openMenu', function(data)
    if type(data) ~= 'table' then
        print('[qb-menu wrapper] Invalid menu structure: not a table')
        return
    end

    -- Handle old qb-menu format
    if data[1] and (data[1].header or data[1].params) then
        local menuOptions = convertLegacyMenu(data)

        lib.registerContext({
            id = 'qb-menu-wrapper-context',
            title = menuOptions[1].title or 'Menu',
            options = menuOptions
        })

        lib.showContext('qb-menu-wrapper-context')
    elseif data.id and data.options then
        -- Native ox_lib format
        lib.registerContext(data)
        lib.showContext(data.id)
    else
        print('[qb-menu wrapper] Unsupported menu structure:', json.encode(data))
    end
end)

-- Optional close menu export
exports('closeMenu', function()
    lib.hideContext()
end)
