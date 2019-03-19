<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_client}}".
 *
 * @property integer $appid
 * @property string $appkey
 * @property integer $status
 * @property string $module_id
 *
 * @property ApiModule $module
 */
class ApiClient extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_client}}';
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
            [['appid', 'appkey', 'module_id'], 'required'],
            [['appid', 'status'], 'integer'],
            [['appkey'], 'string', 'max' => 32],
            [['module_id'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'appid' => Yii::t('app', 'Appid'),
            'appkey' => Yii::t('app', 'Appkey'),
            'status' => Yii::t('app', 'Status'),
            'module_id' => Yii::t('app', 'Module ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getModule()
    {
        return $this->hasOne(ApiModule::className(), ['name' => 'module_id']);
    }
}
