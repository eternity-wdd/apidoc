<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_code}}".
 *
 * @property integer $code
 * @property string $msg
 */
class ApiCode extends \yii\db\ActiveRecord
{
    // 签名错误
    const SIGNATURE_ERROR = -20;
    // 客户端与服务器端时间差超过最大限值
    const TIME_DIFFERENCE_OVERFLOW = -21;
    // 接口不存在
    const API_NOT_EXIST = -22;
    // 应用ID不存在
    const APPID_NOT_EXIST = -23;
    // 登录失败
    const LOGIN_FAILED = -24;
    // 验证用户名存在
    const USER_IS_EXIST = -25;
    // 验证手机号是否存在
    const MOBILE_IS_EXIST = -26;
    // 验证营业执照号是否存在
    const LICENSECODE_IS_EXIST = -27;
    // 逻辑性错误
    const LOGIC_ERROR = 100;
    
    const ADVANCE_NOT_ENOUGH = 101;
    
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_code}}';
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
            [['code', 'msg'], 'required'],
            [['code'], 'integer'],
            [['msg'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'msg' => 'Msg',
        ];
    }
    
    /**
     * 根据获取消息码的文字说明
     * 
     * @param int $code
     * @return string
     */
    public static function getMsg($code)
    {
        $msg = (string)\Yii::$app->dbcommon->createCommand('select `msg` from '.self::tableName() . ' where `code` = ' . "'{$code}'")->queryScalar();
        if(!$msg) $msg = $code;
        return $msg;
    }
}
