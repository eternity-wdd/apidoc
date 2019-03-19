<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_param_type}}".
 *
 * @property integer $id
 * @property string $name
 *
 * @property ApiParam[] $ApiParam
 */
class ApiParamType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_param_type}}';
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
            [['name'], 'string', 'max' => 50],
            [['name'], 'unique']
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApiParam()
    {
        return $this->hasMany(ApiParam::className(), ['pt_id' => 'id']);
    }
    
    public static function loadOptions()
    {
        $data = [];
        $rows = self::find()->orderBy('id asc')->all();
        foreach ($rows as $row)
        {
            $data[$row['id']] = $row['name'];
        }
        return $data;
    }
}
