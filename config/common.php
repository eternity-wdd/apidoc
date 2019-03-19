<?php
$params = require(__DIR__ . '/params.php'); 
$config = [
    'id' => 'basic',
    'version' => 1,
    'language' => 'zh-CN',
    'basePath' => dirname(__DIR__),
    'vendorPath' => dirname(__DIR__) . '/vendor',
    'bootstrap' => ['log'],
    'timeZone'=>'Asia/Shanghai',
    'aliases' => [
        '@mdm/admin' => '@vendor/rbac-admin',
    ],
    'modules' => [
         'rbac-admin' => [
                    'class' => 'mdm\admin\Module',
                    'controllerMap' => [
                        'assignment' => [
                            'class' => 'mdm\admin\controllers\AssignmentController',
                            'userClassName' => 'app\modules\manage\models\Users',
                            'idField' => 'id'
                        ],
                        //				'other' => [
                            //					'class' => 'app\controllers\SiteController', // add another controller
                            //				],
                    ],
                    'layout' => 'left-menu',
                    'mainLayout' => '@app/views/layouts/main.php',
                    'menus' => [
                        'assignment' => [
                            'label' => '分配权限' // change label
                        ],
                        'route' => null, // disable menu
                    ],
                ],
        
    ],
    'components' => [
        /* 'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            //'useFileTransport' =>false,//这句一定有，false发送邮件，true只是生成邮件在runtime文件夹下，不发邮件
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.163.com',  //每种邮箱的host配置不一样
                'username' => 'm15628958629@163.com',
                'password' => 'zhangyue123',
                 'port' => '25',
                'encryption' => 'tls',
                 
            ],
            'messageConfig'=>[
                'charset'=>'UTF-8',
                'from'=>['m15628958629@163.com'=>'admin']
            ],
        ], */

        'i18n' => [
            'translations' => [
                'app*' => [
                    'class' => 'yii\i18n\PhpMessageSource',
                    'basePath' => '@root/messages',
                    //'sourceLanguage' => 'en-US',
                    'fileMap' => [
                        'app' => 'app.php',
                        'app/error' => 'error.php',
                    ],
                ],
            ],
        ],
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'helloxunmall123',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'user' => [
            'identityClass' => 'app\models\User',
            'enableAutoLogin' => true,
            'loginUrl' => 'member/login',
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'db' => require(__DIR__ . '/db.php'),
       /*  'dbshop' => require(__DIR__ . '/db_supplier.php'),
        'dbmall' => require(__DIR__ . '/db_mall.php'),
        'dbofficial' => require(__DIR__ . '/db_official.php'), */
        'setting' => [
            'class' => 'app\foundation\Setting',
            'settings' => [
                'seo.article.tag_max_num' => 5, // SEO设置，单个文章最多可设置的标签数
            ] 
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
          //  'enableStrictParsing' => false
        ],
        'authManager' => [
            // 'class' => 'yii\rbac\PhpManager',
            'class' => 'yii\rbac\DbManager',
          //  'defaultRoles' => ['guest'],
        ],
        'as access' => [
            'class' => 'mdm\admin\components\AccessControl',
            'allowActions' => [
                'site/*',
                'admin/*',
                'rbac-admin/*',
                // The actions listed here will be allowed to everyone including guests.
                // So, 'admin/*' should not appear here in the production, of course.
                // But in the earlier stages of your development, you may probably want to
                // add a lot of actions here until you finally completed setting up rbac,
                // otherwise you may not even take a first step.
            ]
        ],
    ],
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];

    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
}

return $config;
