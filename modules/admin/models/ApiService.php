<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "{{dc_api_module}}".
 *
 * @property string $name
 * @property string $label
 *
 * @property Api[] $apis
 */
class ApiService extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{dc_api_service}}';
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
            [['name', 'label'], 'required'],
            [['name', 'label', 'service_url','system_id'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'name' => Yii::t('app', 'Service Name'),
            'label' => Yii::t('app', 'Service Label'),
            'service_url' => Yii::t('app', 'Service Url'),
            'system_id' => Yii::t('app', 'System ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApis()
    {
        return $this->hasMany(Api::className(), ['service_id' => 'name']);
    }
    public function getGroups()
    {
        return $this->hasMany(ApiGroup::className(), ['service_id' => 'name']);
    }
    
    /**
     * @return array
     */
    public static function loadOptions()
    {
        $options = [];
        $rows = self::find()->all();
    
        foreach ($rows as $row)
        {
            $options[$row['name']] = $row['label'];
        }
        return $options;
    }
    
    public static function getPublish($res)
    {
        if($res){
            return '是';
        }else{
            return '否';
        }
    }
    
    public function getMethod($res){
        switch ($res){
            case 1:
                return 'POST';
                break;
            case 2:
                return 'GET';
                break;
            case 1:
                return 'POST和GET';
                break;
        }
    }
    
    public function getPlatforms($res){
        $result = '';
        if($res){
            foreach ($res as $k=>$v){
                $result .= ApiClientPlatform::find()->select(['name'])->where(['bit'=>$v])->one()->name.'　';
            }
            return $result;
        }
        return '无 ';
    }
}
