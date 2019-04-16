<?php

return [
    'adminEmail' => 'coder_lizheng@163.com',
    'max_time_difference' => '300',
    'uploadUrl' => '_{{UPLOAD_URL}}_',
    'bannerImgUrl' => '_{{BANNER_URL}}_',
	'reflshTime' => '500',
	'md5_key' =>'jinglan_api',
	'email_address'=>'_{{MALL_URL}}_',
    'api'=>[
        'purchaser'=>[
            'domain'=>'_{{PURCHASER_HOST}}_'
        ],
        'official'=>[
            'domain'=>'_{{OFFICIAL_HOST}}_'
        ],
        'inner'=>[
            'domain'=>'_{{INNER_HOST}}_'
        ],
        'supplier'=>[
            'domain'=>'_{{SUPPLIER_HOST}}_'
        ],
        'standard'=>[
            'domain'=>'_{{STANDARD_HOST}}_'
        ], 
        'datamap'=>[
            'domain'=>'_{{DATAMAP_HOST}}_'
        ],       
    ],
];
