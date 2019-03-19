<?php
namespace app\controllers;
use yii\web\Controller;

class DefaultController extends Controller{
    
    public function init(){
        $this->layout = 'api';
        $session = \Yii::$app->session;
        if(empty($session['email']) || empty($session['isLogin'])){
            $this->redirect(['/member/login']);
        }
    }
}