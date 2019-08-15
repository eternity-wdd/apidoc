<?php

namespace app\controllers;

use app\modules\admin\models\Api;
use Yii;
use app\controllers\DefaultController;
use yii\web\Controller;
use app\models\ApiClientPlatform;
use app\models\XmApiPublic;
use app\modules\admin\controllers\BaseController;
class DcApiController extends BaseController
{
    public function init()
    {
        $this->layout = 'api';    
    }

    /**
     * 应用(模块)列表
     * @return string
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionIndex()
    {
        $module = \Yii::$app->request->get('m');
        $apis = Api::find()->where(['service_id'=>\Yii::$app->request->get('m')])->all();
        $rows = Api::findBySql('SELECT t2.*,t1.publish
                                FROM dc_api t1 
                                LEFT JOIN dc_api_service t2 ON t1.service_id = t2.name
                                WHERE t1.service_id = "'.$module.'"
                                GROUP BY t1.service_id') ->all();
//         echo "<pre>";print_r($rows);exit();
       /*    var_dump($rows);exit(); */
//         echo "<pre>";print_r($api->platforms);exit;
        return $this->render('index', 
            [
             'module'=>$module,
             'rows'=>$rows,
             'apis'=>$apis
                
            ]);
    }
    
    public function actionView()
    {
        $api = Api::findOne(\Yii::$app->request->get('id'));
//        echo "<pre>";var_dump($api);exit;
        return $this->render('view', [
            'api'=>$api,
        ]);
    }
    public function actionCode()
    {
        $code = ApiCode::find()->all();
    
        return $this->render('code', ['code'=>$code]);
    }
    
    public function actionPublic(){
        $code = XmApiPublic::find()->all();
        return $this->render('public', ['code'=>$code]);
    }
    
    
    
}
