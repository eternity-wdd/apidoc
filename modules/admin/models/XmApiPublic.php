<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "dc_api_public".
 *
 * @property string $paramname
 * @property string $require
 * @property string $type
 * @property string $des
 */
class XmApiPublic extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dc_api_public';
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
            [['paramname', 'require', 'type', 'des'], 'required'],
            [['paramname', 'require', 'type'], 'string', 'max' => 50],
            [['des'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'paramname' => 'Paramname',
            'require' => 'Require',
            'type' => 'Type',
            'des' => 'Des',
        ];
    }
}
