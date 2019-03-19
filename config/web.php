<?php

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'layout' => 'frontend',
    'modules' => [
        'manage' => [
            'class' => 'app\modules\manage\Module',
        ],
    ],
    'components' => [
        'QR' => [
            'class' => 'app\components\QR'
        ],
    ]
];

return $config;
