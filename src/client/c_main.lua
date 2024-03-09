Notify = {
    isLoaded = false
}

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do 
        Wait(5000)
    end

    Wait(2000) -- Wait for the NUI to be ready

    SendNUIMessage({
        message = 'setData',
        data = Config
    })

    Notify.isLoaded = true

    print('[dillen_notify] Ready to use')
end)

function Notify:new(data)
    if not self.isLoaded then return end;

    SendNUIMessage({
        message = 'createNotification',
        data = {
            message = data.message or 'No message provided',
            title= data.title or 'Notification',
            type = data.type or 'info',
            duration = data.duration or 4000,
        }
    })
end

RegisterNetEvent("dillen_notify:sendNotification")
AddEventHandler("dillen_notify:sendNotification", function(data)
    Notify:new(data)
end)

exports('sendNotification', function(data)
    Notify:new(data)
end)

RegisterCommand('notification', function()
    Notify:new({
        message = 'This is a ~r~error~s~ a notification',
        title = 'Error',
        type = 'error',
        duration = 5000
    })

    Wait(1000)

    Notify:new({
        message = 'This is a ~o~warning~s~ a notification',
        title = 'Warning',
        type = 'warning',
        duration = 5000
    })

    Wait(1000)

    Notify:new({
        message = 'This is a ~g~success~s~ a notification',
        title = 'Success',
        type = 'success',
        duration = 5000
    })

    Wait(1000)

    Notify:new({
        message = 'This is a ~b~info~s~ notification',
        title = 'Info',
        type = 'info',
        duration = 5000
    })
end)