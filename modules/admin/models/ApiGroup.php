<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "{{dc_api_group}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $module_id
 * @property string $desc
 * @property integer $priority
 *
 * @property Api[] $apis
 * @property ApiService $module
 */
class ApiGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{dc_api_group}}';
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
            [['name', 'module_id'], 'required'],
//             [['priority'], 'integer'],
            ['priority','double','max'=>90,'min'=>1],
            [['name', 'module_id'], 'string', 'max' => 50],
            [['desc'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' =>'组名',
            'module_id' => Yii::t('app', 'Module ID'),
            'desc' => Yii::t('app', 'Desc'),
            'priority' => Yii::t('app', 'Priority'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApis()
    {
        return $this->hasMany(Api::className(), ['group_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getModule()
    {
        return $this->hasOne(ApiService::className(), ['name' => 'module_id']);
    }
    
    /**
     * @return array
     */
    public static function loadOptions($moduleId)
    {
        $options = [];
        $rows = self::find()->where(['module_id'=>$moduleId])->all();
        
        
        foreach ($rows as $row)
        {
            $options[$row['id']] = $row['name'];   
        }
        
        return $options;
    }
}
