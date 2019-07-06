<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%api}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $label
 * @property integer $need_login 
 * @property integer $version 
 * @property integer $publish 
 * @property integer $method 
 * @property integer $platforms 
 * @property integer $group_id
 * @property string $module_id
 * @property integer $priority
 * @property string $description
 * @property string $example 
 * @property string $response
 *
 * @property ApiModule $module
 * @property ApiGroup $group
 * @property ApiParam[] $inParams
 * @property ApiParam[] $outParams
 */
class Api extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%api}}';
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
            [['version'],'double','max'=>90,'min'=>1],
            [['version' ,'group_id','priority','method'], 'required'],
            [['name', 'label', 'module_id'], 'required'],
            [['group_id', 'need_login', 'version', 'publish',  'priority'], 'integer'],
            [['example', 'response'], 'string'],
            ['request_sample','string','max'=>10000],
            [['name'], 'string', 'max' => 60],
            [['label'], 'string', 'max' => 100],
            [['module_id'], 'string', 'max' => 50],
            [['description'], 'string', 'max' => 255]
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
            'label' => Yii::t('app', 'Label'),
            'group_id' => Yii::t('app', 'Group'),
            'module_id' => Yii::t('app', 'Module'),
            'need_login' => Yii::t('app', 'Need Login'), 
            'version' => Yii::t('app', 'Version'), 
            'publish' => Yii::t('app', 'Publish'), 
            'method' => Yii::t('app', 'Method'),
            'platforms' => Yii::t('app', 'Platforms'),
            'priority' => Yii::t('app', 'Priority'),
            'description' => Yii::t('app', 'Description'),
            'example' => Yii::t('app', 'Request Example Code'),
            'response' => Yii::t('app', 'Success Response'),
            'request_sample' => '请求示例',
        ];
    }

    
    
    /**
     * {@inheritDoc}
     * @see \yii\db\BaseActiveRecord::getAttribute($name)
     */
    public function __get($name)
    {
        // TODO Auto-generated method stub
       /*  if('platforms' == $name)
        {
            $value = $this->_attributes[$name];
            echo '<pre>';print_r($value);
            $platforms = [];
            
            for($i = 0; $i < 16; $i++)
            {
                $signal = 1 << $i;
                echo 's:'.$signal.'<br />';
                if($signal & $value)
                    $platforms[] = $signal;
                    
            }
            return $platforms;
        }
         */
        return parent::__get($name);
    }

    /**
     * {@inheritDoc}
     * @see \yii\base\Arrayable::toArray()
     */
    public function toArray(array $fields = array(), array $expand = array(), $recursive = true)
    {
        // TODO Auto-generated method stub
        
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getModule()
    {
        return $this->hasOne(ApiModule::className(), ['name' => 'module_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGroup()
    {
        return $this->hasOne(ApiGroup::className(), ['id' => 'group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInParams()
    {
        return ApiParam::find()->where(['api_id'=>$this->id, 'out'=>0])->all();
    }
    
    public function getWll()
    {
        return "111";
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOutputParams()
    {
        return ApiParam::find()->where(['api_id'=>$this->id, 'out'=>1])->orderBy('priority')->all();
    }
    
    public static function methodOptions()
    {
        return [1=>'POST', 2=>'GET'];
    }
    
    public static function methodLabel($value)
    {
        $options = self::methodOptions();
        $label = '';
        
        foreach ($options as $key=>$method)
        {
            if($value & (int)$key) $label .= $method.' ';
        }
        
        return $label;
    }
}
