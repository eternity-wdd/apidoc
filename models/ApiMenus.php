<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "jl_menus".
 *
 * @property string $id
 * @property integer $group
 * @property string $name
 * @property string $url
 * @property string $parent_id
 * @property string $sort
 * @property string $icon_class
 * @property integer $status
 */
class ApiMenus extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jl_menus';
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
            [['group', 'name', 'url', 'status'], 'required'],
            [['group', 'parent_id', 'sort', 'status'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['url'], 'string', 'max' => 255],
            [['icon_class'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'group' => 'Group',
            'name' => 'Name',
            'url' => 'Url',
            'parent_id' => 'Parent ID',
            'sort' => 'Sort',
            'icon_class' => 'Icon Class',
            'status' => 'Status',
        ];
    }
    
    public static function getMenuTree($group)
    {
        $query = "SELECT m.* FROM jl_menus AS m
	               WHERE m.group=:group
	               AND m.status=0
	               ORDER BY `sort` asc, `id` asc";
        $command = Yii::$app->db->createCommand($query, array(':group'=>$group));
        $data = $command->queryAll();
        $tmp = array();
        $rows = array();
    
        foreach ($data as $item)
        {
            $rows[$item['id']] = $item;
        }
         
        foreach ($rows as $row)
        {
            if($row['parent_id'] && isset($rows[$row['parent_id']]))
            {
                if($row['status'] == 0
                //                     && Yii::$app->user->can($row['permissions'])
                    )
                {
                    $tmp[$row['parent_id']]['children'][$row['id']] = array(
                        'name'=>$row['name'],
                        'status'=>$row['status'],
                        'url'=>$row['url'],
                        'icon'=>$row['icon_class'],
                    );
                }
            }
            else
            {
                $tmp[$row['id']]['name'] = $row['name'];
                $tmp[$row['id']]['status'] = $row['status'];
                $tmp[$row['id']]['url'] = $row['url'];
                $tmp[$row['id']]['icon_class'] = $row['icon_class'];
            }
        }
         
        $tree = array();
         
        foreach ($tmp as $key=>$item)
        {
            $tree[$key] = $item;
        }
    
        return $tree;
    }
}
