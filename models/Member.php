<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "jl_member".
 *
 * @property string $id
 * @property string $email
 * @property string $password
 * @property string $addtime
 * @property string $email_code
 */
class Member extends \yii\db\ActiveRecord
{
    public $rememberMe = true;
    public $repassword;
    public $verifyCode; 
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jl_member';
    }

    /**
     * @return \yii\db\Connection the database connection used by this AR class.
     */
    public static function getDb()
    {
        return Yii::$app->get('db');
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['email', 'password'], 'required'],
            [['email', 'password','nickname'], 'required'],
            [['addtime'], 'integer'],
            [['email'], 'email'],
            [['password', 'repassword'], 'string', 'max' => 32,'min'=>6],
            /* ['verifyCode', 'captcha','captchaAction'=>'/site/captcha'], */
            ['verifyCode', 'captcha','captchaAction'=>'/site/captcha'], 
            /* ['verifyCode', 'captchacha','message'=>'验证码错误啦'], */
            ['email', 'unique', 'message' => '邮箱已被注册'],
            ['nickname', 'unique', 'message' => '昵称已存在'],
            ['repassword', 'compare', 'compareAttribute' => 'password', 'message' => '两次密码输入不一致'],
        ];
    }
    public function chkemail($attribute,$params){
       $user = self::find()->where(['email'=>$this->email])->one();
       if($user){
           if(md5($this->password) == $user['password']){
               return true;
           }else{
               $this->addError($attribute,'用户名或密码错误');
               return false;
           }
           
       }else{
           $this->addError($attribute,'用户名或密码错误');
           return false;
       }
    }

    public function captchacha($attribute){
        if($_SESSION['__captcha/site/captcha']===Yii::$app->request->post('Member')['verifyCode']){
            return true;
        }else{
            $this->addError($attribute,'验证码验证失败');
            return false;
        }
        /* print_r($_SESSION);
         var_dump(Yii::$app->request->post('LoginForm'));exit;*/
    }
    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'email' => '您的邮箱',
            'password' => '请输入密码',
            'addtime' => 'Addtime',
            'email_code' => 'Email Code',
            'repassword' => '请再次输入密码',
            'nickname'=>'输入您的昵称',
            'verifyCode' =>'请输入验证码'
        ];
    }
    
    
    public function login($attribute,$data){
        $user = self::find()->where(['emial'=>$data['Member']['emial']])->one();
        if($user){
            if(md5($data['Member']['password']) == $user['password']){
                if($user['email_code'] == ''){
                    $lifetime = $this->rememberMe ? 24*3600 : 0;
                    $session = Yii::$app->session;
                    session_set_cookie_params($lifetime);
                    $session['email'] = $user['email'];
                    $session['isLogin'] = 1;
                    return true;
                }else{
                    $this->addError($attribute, '账号还未验证,请到邮箱中验证');
                }
            }else{
                $this->addError($attribute, '账号或密码不正确');
            }
        }else{
            $this->addError($attribute, '账号或密码不正确');
        }
    }
}





















