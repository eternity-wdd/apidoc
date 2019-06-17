<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api_module}}".
 *
 * @property string $name
 * @property string $label
 *
 * @property Api[] $apis
 */
class ApiModule extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api_module}}';
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
            [['name', 'label', 'domain'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'name' => Yii::t('app', 'Name'),
            'label' => Yii::t('app', 'Label'),
            'domain' => Yii::t('app', 'Domain'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApis()
    {
        return $this->hasMany(Api::className(), ['module_id' => 'name']);
    }
    public function getGroups()
    {
        return $this->hasMany(ApiGroup::className(), ['module_id' => 'name']);
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
    
    public function getNeedlogin($res)
    {
        if($res){
            return '是';
        }else{
            return '否';
        }
    }
    
    public function getGroup($res) {
      $a =  ApiGroup::find()->where(['id'=>$res])->one();
      return $a->name;
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
