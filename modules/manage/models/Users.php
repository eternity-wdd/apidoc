<?php

namespace app\modules\manage\models;

use Yii;

/**
 * This is the model class for table "xm_users".
 *
 * @property string $id
 * @property string $username
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $portrait
 */
class Users extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'xm_users';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'auth_key', 'password_hash', 'created_at', 'updated_at'], 'required'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'password_hash', 'password_reset_token', 'portrait'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['username'], 'unique'],
            [['password_reset_token'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'auth_key' => 'Auth Key',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'portrait' => 'Portrait',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIssues()
    {
        return $this->hasMany(Issues::className(), ['uid' => 'id']);
    }
    public static function findIdentity($id)
    {
        //找到一个身份通过给定ID。
        return static::findOne($id);
    }
    
    public static function findIdentityByAccessToken($token, $type = null)
    {
        //找到一个给定的身份令牌
        return static::findOne(['access_token' => $token]);
    }
    
    public function getId()
    {
        //返回一个ID,可以唯一地标识一个用户的身份。
        return $this->id;
    }
    
    public function getAuthKey()
    {
        //返回键,可以用来检查一个给定的身份标识的有效性。
        return $this->authKey;
    }
    
    public function validateAuthKey($authKey)
    {
        //验证给定的身份
        return $this->authKey === $authKey;
    }
    
    
}
