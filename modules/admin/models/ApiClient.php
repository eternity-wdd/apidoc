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
            [['client_id', 'secret', 'system_id'], 'required'],
            [['status'], 'integer'],
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
            'name' => Yii::t('app', '应用名称'),
            'client_id' => Yii::t('app', '客户应用ID'),
            'secret' => Yii::t('app', '应用密钥'),
            'status' => Yii::t('app', '1表示可用，其它不可用'),
            'system_id' => Yii::t('app', '所属平台'),
            'env' => Yii::t('app', '所属环境'),
            'from' => Yii::t('app', 'from来源'),
        ];
    }
}
