<?php
namespace app\modules\admin\models;

use Yii;
use yii\base\Model;
use yii\captcha\CaptchaAction;
use app\modules\admin\models\User;

/**
 * Login form
 */
class LoginForm extends Model
{
    public $username;
    public $password;
    public $rememberMe = true;
    public $verifyCode;
    private $_user;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password','verifyCode'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'validatePassword'],
            ['verifyCode', 'captchacha','message'=>'验证码错误啦'],
        ];
    }
    

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */

    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, '账号或密码错误');
            }
        }
    }
    public function captchacha($attribute){
        if($_SESSION['__captcha/site/captcha']===Yii::$app->request->post('LoginForm')['verifyCode']){
            return true;
        }else{
            $this->addError($attribute,'验证码验证失败');
            return false;
        }
       /* print_r($_SESSION);
        var_dump(Yii::$app->request->post('LoginForm'));exit;*/
    }
    /**
     * Logs in a user using the provided username and password.
     *
     * @return boolean whether the user is logged in successfully
     */
    public function login()
    {
        if ($this->validate()) {
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        } else {
            return false;
        }
    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->username);
        }

        return $this->_user;
    }
    public function attributeLabels()
    {
        return [
            'username' =>'用户名',
            'password'=>'请输入密码',
            'verifyCode' =>'验证码',
        ];
    }
}
