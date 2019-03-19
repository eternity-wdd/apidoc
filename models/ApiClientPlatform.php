<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_client_platform}}".
 *
 * @property integer $id
 * @property string $name
 * @property integer $bit
 *
 * @property ApiClient[] $apiClients
 */
class ApiClientPlatform extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_client_platform}}';
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
            [['name'], 'required'],
            [['bit'], 'integer'],
            [['name'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'bit' => Yii::t('app', 'Bit'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApiClients()
    {
        return $this->hasMany(ApiClient::className(), ['platform' => 'id']);
    }
    
    /**
     * @return array
     */
    public static function loadBitOptions($moduleId)
    {
        $options = [];

        $rows = self::find()->where(['module_id'=>$moduleId])->all();
        foreach ($rows as $row)
        {
            $options[$row['bit']] = $row['name'];
        }
//        echo "22"."<pre>";print_r($rows);exit;
        return $options;
    }
}
