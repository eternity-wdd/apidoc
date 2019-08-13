<?php

namespace app\modules\admin\controllers;

use yii\web\Controller;
use app\models\LoginForm;
use app\models\User;
use Yii;
use yii\web\ForbiddenHttpException;
class DefaultController extends Controller
{
    public $layout ="main1";
    
    public function beforeAction($action)
    {
    
        if ( $action->id == 'login'|| $action->id == 'captcha' || $action->id == 'error'||$action->id == 'userout') {
            return true;
        }
        if (!Yii::$app->user->identity) {
            $this->redirect(['default/login']);
            return false;
        } else {
            return true;
        }
    }
    
 
    
    public function actionIndex()
    {
        return $this->redirect(['api/list']);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        $this->layout = false;
        
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
            //  return $this->redirect(['/setting/index']);
        }
        $model = new LoginForm();
        if(Yii::$app->request->isPost){
        
            $data = Yii::$app->request->post();
            $user = User::find()->select('is_stage')->where(['username'=>$data['LoginForm']['username']])->one();
            if($user['is_stage'] == '1'){
                throw new ForbiddenHttpException('您没有权限');
            }else{
                if ($model->load(Yii::$app->request->post()) &&$model->login()) {
                    return $this->redirect(['default/index']);
                    // return $this->goBack();
                } else {
                    
                    return $this->render('login', [
                        'model' => $model,
                    ]);
                }
            }
        }else{
            return $this->render('login', [
                'model' => $model,
            ]);
        }
        

    }
    
    public function actionUserout()
    {
        if(Yii::$app->user->logout()){
            return $this->redirect('login');
        }
       
        //return $this->goHome();
    }
}
