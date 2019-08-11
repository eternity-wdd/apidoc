<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=_{{DB_HOST}}_;dbname=_{{DB_NAME}}_',
    'username' => '_{{DB_USER}}_',
    'password' => '_{{DB_PASSWORD}}_',
    'charset' => 'utf8',
    'tablePrefix' => 'jl_',
];
