<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_params}}".
 *
 * @property integer $id
 * @property integer $api_id
 * @property string $name
 * @property string $label
 * @property integer $pt_id
 * @property integer $request
 * @property integer $out
 * @property string $desc
 * @property integer $priority
 *
 * @property Api $api
 * @property ApiParamType $pt
 */
class ApiParam extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_params}}';
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
            [['api_id', 'name', 'label', 'pt_id','priority','out','showtype'], 'required'],
            [['api_id', 'pt_id', 'request', 'out', 'priority'], 'integer'],
            [['name', 'label'], 'string'],
            [['desc'], 'string'],
            [['param_cont'],'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'api_id' => Yii::t('app', 'Api ID'),
            'name' => Yii::t('app', 'name'),
            'label' => Yii::t('app', 'Label'),
            'pt_id' => Yii::t('app', 'Pt ID'),
            'request' => Yii::t('app', 'Request'),
            'out' => Yii::t('app', 'Out'),
            'desc' => Yii::t('app', 'Description'),
            'priority' => Yii::t('app', 'Priority'),
            'showtype' => '前台展现形式',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApi()
    {
        return $this->hasOne(Api::className(), ['id' => 'api_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPt()
    {
        return $this->hasOne(ApiParamType::className(), ['id' => 'pt_id']);
    }
}
