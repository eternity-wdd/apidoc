<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use app\models\LoginForm;

use app\foundation\UploadHandler;
use app\models\User;

class SiteController extends \yii\web\Controller
{
    public $enableCsrfValidation = false;
    /* public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'index'],
                'rules' => [
                    [
//                         'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    } */

public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
                //'backColor'=>0x000000,//背景颜色
                'maxLength' => 3, //最大显示个数
                'minLength' => 3,//最少显示个数
                //'padding' => 5,//间距
                'height'=>50,//高度
                'width' => 180,  //宽度
                // 'foreColor'=>0xffffff,     //字体颜色
                //'offset'=>4,        //设置字符偏移量 有效果
                //'controller'=>'login',        //拥有这个动作的controller
            ],
        ];
    }

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }
        
        return $this->renderPartial('login', [
            'model' => $model,
        ]);
    }

    public function actionRegister()
    {
        return $this->renderPartial('register');
    }
    
    public function actionUpload()
    {
        return $this->renderPartial('uploadImg');
    }
    
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
    
    public function actionTest()
    {
        $params = Yii::$app->request->get('rule_uname');
        $result = yii::$app->member->createCommand("SELECT license_code,uname FROM sdb_members WHERE uname='{$params}'")->queryOne();
        
        if($result)
        {
            return $this->renderPartial('uploadImg',['license_code'=>$result['license_code'],'uname'=>$result['uname']]);
        }else 
        {
            return $this->renderPartial('register');
        }
    }
    
    public function actionUploads()
    {
        //file_put_contents('d:\h.log',print_r($_FILES,true));
//         $inputFileName = \Yii::$app->request->get('fname');
//         $upload_handler = new UploadHandler(null, true, null, $inputFileName);
    }
    
    public function actionList()
    {
        return $this->renderPartial('goodslist');
    }
    
    public function actionDetail()
    {
        return $this->renderPartial('goodsdetail');
    }
  
}
