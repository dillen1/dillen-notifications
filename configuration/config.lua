Config = {
    Background = 'rgba(31, 40, 54, 1.0)', -- Background color of the notification
    Align = 'center', -- Options: top, center, bottom

    -- Notification types and their colors and icons (you can add more types)
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
};