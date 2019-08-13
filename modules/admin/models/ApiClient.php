<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "dc_api_client".
 *
 * @property integer $id
 * @property string $name
 * @property string $client_id
 * @property string $secret
 * @property integer $status
 * @property string $system_id
 * @property string $env
 * @property string $from
 *
 * @property App $from0
 * @property DcApiService $system
 */
class ApiClient extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dc_api_client';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'client_id', 'secret', 'system_id'], 'required'],
            [['id', 'status'], 'integer'],
            [['name', 'client_id'], 'string', 'max' => 64],
            [['secret'], 'string', 'max' => 32],
            [['system_id'], 'string', 'max' => 50],
            [['env'], 'string', 'max' => 20],
            [['from'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Client Name'),
            'client_id' => Yii::t('app', 'Client ID'),
            'secret' => Yii::t('app', 'Secret'),
            'status' => Yii::t('app', 'Status'),
            'system_id' => Yii::t('app', 'System ID'),
            'env' => Yii::t('app', 'Env'),
            'from' => Yii::t('app', 'From'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFrom0()
    {
        return $this->hasOne(App::className(), ['appid' => 'from']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSystem()
    {
        return $this->hasOne(DcApiService::className(), ['name' => 'system_id']);
    }
}
