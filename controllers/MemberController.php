<?php
namespace app\controllers;

use app\models\Member;
use yii\web\Controller;
use Yii;
use app\models\LoginForm;
use app\models\User;
/* use mdm\admin\models\searchs\User; */
class MemberController extends Controller
{
    public function init()
    {
        $this->layout = 'api';
    }
    
    
    public function actionLogin(){
        
        
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        } 
        $model = new LoginForm();
        if(Yii::$app->request->isPost){
            
            $data = Yii::$app->request->post();
            $user = User::find()->where(['username'=>$data['LoginForm']['username']])->one();
            if($user['username']){
                if(empty($user['email_code'])){
                    if($user['status'] == '10'){
                        if ($model->load(Yii::$app->request->post()) &&$model->login()) {
                            return $this->redirect(['site/index']);
                            // return $this->goBack();
                        }else {
                            return $this->render('login', [
                                'model' => $model,
                            ]);
                        }
                    }else{
                        echo "<script>alert('账号禁止登入,请联系管理员');history.back()</script>";
                    }
                }else{
                    echo "<script>alert('账号还未验证,请到邮箱中验证!');history.back()</script>";
                }
            }else{
                echo "<script>alert('账号或密码错误！');history.back()</script>";
            }

           
        }else{
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }
    
    public function actionLogout()
    {
        if(Yii::$app->user->logout(false)){
            return $this->redirect('login');
        }
         
        //return $this->goHome();
    }
    
    /*
     * 用户注册及邮箱验证
     */
    public function actionSignup()
    {
        $model = new User();
        if(\Yii::$app->request->post()){
            if($model->load(\Yii::$app->request->post())){
                if (Yii::$app->request->isAjax)
                {
                    Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
                    return \yii\bootstrap\ActiveForm::validate($model);
        
                }else{
                    $model->created_at = time();
                    $model->status = '10';
                    $model->portrait = '/static/portrait/admin@1473323616.jpg';
                    $model->auth_key = mt_rand();
                    //$model->form = '1';
                    $model->email_code = md5(uniqid());
                    $model->password_hash = Yii::$app->getSecurity()->generatePasswordHash($model->password_hash);
                    $model->repassword = Yii::$app->getSecurity()->generatePasswordHash($model->repassword);
                    $chkemail = 'http://'.\Yii::$app->params['email_address'].'/member/chkemail?code='.$model->email_code;
                    if($model->save(false)){
                        $mailer = new \yii\swiftmailer\Mailer();
                        $mailer->transport=[
                            'class' => 'Swift_SmtpTransport',
                            'host' => 'smtp.163.com',
                            'username' => 'm15628958629@163.com',
                            'password' => 'zhangyue123',
                            'port' => '25',
                            'encryption' => 'tls',//    tls | ssl
                        ];
                        $mailer->messageConfig=[
                            'charset'=>'UTF-8',
                            'from'=>['m15628958629@163.com'=>'京蓝科技']
                        ];
                        $mailer->useFileTransport = false;
                        $mail= $mailer->compose();
                        $mail->setTo($model->email);
                        $mail->setSubject("京蓝API帮助文档注册");
                        //$mail->setTextBody(' ');   //发布纯文字文本
                        $mail->setHtmlBody("<a href=$chkemail>点击此链接,完成验证</a>");
                        if($mail->send()){
                            return $this->redirect(['view']);
                        }
                    }
                }
            }
        }else{
            return $this->render('signup', ['model'=>$model]);
        }
    }
    
    /*
     * 邮箱验证
     */
    public function actionChkemail(){
        $email_code = \Yii::$app->request->get('code');
        if($email_code){
            $member = User::find()->where(['email_code'=>$email_code])->one();
            if($member){
                $member->email_code = '';
                if($member->save(false)){
                    echo '邮箱已验证,现在您可以登入了！';
                }else {
                    var_dump($member->getErrors());
                }
                
            }
        }
        
    }
    
    public function actionView($email_code){
        $member = User::find()->where(['email_code'=>$email_code])->groupBy('');
        return $this->render('view');
    }
}
















