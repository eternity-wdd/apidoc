<?php

namespace app\controllers;

use Yii;
use app\controllers\DefaultController;
use yii\web\Controller;
use app\models\ApiGroup;
use app\models\Api;
use app\models\ApiCode;
use app\models\ApiClientPlatform;
use app\models\XmApiPublic;
use app\modules\manage\controllers\BaseController;
use app\models\ApiParam;
class ApiController extends BaseController
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
        $groups = ApiGroup::find()->where(['module_id'=>\Yii::$app->request->get('m')])->all();
        $apis = Api::find()->where(['module_id'=>\Yii::$app->request->get('m')])->all();
        $rows = Api::findBySql('SELECT t2.*,t1.publish
                                FROM xm_api t1 
                                LEFT JOIN xm_api_group t2 ON t1.group_id = t2.id
                                WHERE t1.module_id = "'.$module.'"
                                GROUP BY t1.group_id') ->all();
//         echo "<pre>";print_r($rows);exit();
       /*    var_dump($rows);exit(); */
//         echo "<pre>";print_r($api->platforms);exit;
        return $this->render('index', 
            [
             'groups'=>$groups,
             'module'=>$module,
             'rows'=>$rows,
             'apis'=>$apis
                
            ]);
    }
    
    public function actionView()
    {
        $api = Api::findOne(\Yii::$app->request->get('id'));
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
