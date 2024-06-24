# DILLEN NOTIFICATIONS

## Exports List (Clientsided)

### How to send an notifcation with our export
```lua
--- @param data: {
--     message = string,
--     title = string,
--     type = string,
--     duration = int
-- }
exports['dillen_notifications']:sendNotification(data)
```
## Trigger Events (Serversided)
### How to send an notification from server side with our trigger
Here is an example:
```lua
TriggerClientEvent('dillen_notify:sendNotification', playerId, {
    message = 'This is a ~r~error~s~ notification',
    title = 'Error',
    type = 'error',
    duration = 5000
})
```
## ESX compatibility
### Navigate to es_extended/client/functions.lua
Find **ESX.ShowNotification** and replace the function with the following code:
```lua
function ESX.ShowNotification(message, type, data)
    if GetResourceState("dillen-notifications") ~= "missing" then
        local _data = data or {}

        return exports['dillen-notifications']:sendNotification({
            message = message,
            type = type or 'info',
            title = _data.title or 'Notification',
            duration = _data.duration or 4000
        })
    end
end
```
## QB-Core compatibility
### Navigate to qb-core/client/functions.lua
Find **QBCore-Functions.Notify** and replace the function with the following code:
```lua
function QBCore.Functions.Notify(message, type, data)
    if GetResourceState("dillen-notifications") ~= "missing" then
        local _data = data or {}

        return exports['dillen-notifications']:sendNotification({
            message = message,
            type = type or 'info',
            title = _data.title or 'Notification',
            duration = _data.duration or 4000
        })
    end
end
```
