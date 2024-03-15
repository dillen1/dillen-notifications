Config = {
    Background = 'rgba(31, 40, 54, 1.0)', -- Background color of the notification

    UseSound = true, -- Use a sound when a notification is shown

    Position = {
        Align = 'center', -- Options: top, center, bottom
        Side = 'right', -- Options: left, right
    },

    -- Notification types and their colors and icons (you can add more types)
    -- Icons can be fined here: https://pictogrammers.com/library/mdi/
    Types = {
        ['success'] = {
            ['color'] = '#4caf50',
            ['icon'] = 'mdi-check'
        },
        ['error'] = {
            ['color'] = '#ef5350',
            ['icon'] = 'mdi-alert-circle-outline'
        },
        ['warning'] = {
            ['color'] = '#ff9800',
            ['icon'] = 'mdi-account-alert'
        },
        ['info'] = {
            ['color'] = '#61a5fb',
            ['icon'] = 'mdi-information'
        },
    }
}