<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "dc_api_errcode".
 *
 * @property string $error
 * @property string $error_description
 * @property string $info
 */
class ApiErrcode extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dc_api_errcode';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['error', 'error_description', 'info'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'error' => Yii::t('app', 'Error'),
            'error_description' => Yii::t('app', 'Error Description'),
            'info' => Yii::t('app', 'Info'),
        ];
    }
}
