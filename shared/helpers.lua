function GetClosestModelWithinDistance(maxDistance, items)
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)

    local closestModelCoords, closestModelHandle, closestTextOffset
    local closestDistance = maxDistance + 1

    local function checkAndUpdateClosest(modelHash, textOffset)
        local modelHandle = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 10.0, modelHash, false, false, false)

        if DoesEntityExist(modelHandle) then
            local modelCoords = GetEntityCoords(modelHandle)
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, modelCoords.x, modelCoords.y, modelCoords.z, true)

            if distance <= maxDistance and distance < closestDistance then
                closestModelCoords = modelCoords
                closestModelHandle = modelHandle
                closestTextOffset = textOffset
                closestDistance = distance
            end
        end
    end

    for _, modelPropData in ipairs(items) do
        checkAndUpdateClosest(modelPropData.model, modelPropData.textHeightOffset)
    end

    return closestModelCoords, closestModelHandle, closestTextOffset
end

function DrawError2D(text, seconds)
    local startTime = GetGameTimer()
    local duration = seconds * 1000

    while GetGameTimer() - startTime < duration do
        DrawText2D(0.5, 0.8, '~r~' .. text, 0.6, true)
        Citizen.Wait(0)
    end
end

function DrawSuccess2D(text, seconds)
    local startTime = GetGameTimer()
    local duration = seconds * 1000

    while GetGameTimer() - startTime < duration do
        DrawText2D(0.5, 0.8, '~g~' .. text, 0.6, true)
        Citizen.Wait(0)
    end
end

function DrawText3D(x, y, z, scale, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(_x, _y)
end

function DrawText2D(x, y, text, scale, center)
    -- Draw text on screen
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    --SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    if center then 
    	SetTextJustification(0)
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end