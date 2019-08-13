<?php

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'layout' => 'frontend',
    'modules' => [
        'manage' => [
            'class' => 'app\modules\manage\Module',
        ],
        'admin' => [
            'class' => 'app\modules\admin\Module',
        ],
    ],
    'components' => [
        'QR' => [
            'class' => 'app\components\QR'
        ],
    ]
];

return $config;
