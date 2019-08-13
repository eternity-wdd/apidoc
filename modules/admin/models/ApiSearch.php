<?php

namespace app\modules\admin\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\Api;

/**
 * ApiSearch represents the model behind the search form about `app\modules\admin\models\Api`.
 */
class ApiSearch extends Api
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'priority'], 'integer'],
            [['name', 'label', 'service_id', 'description'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Api::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'priority' => $this->priority,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'label', $this->label])
            ->andFilterWhere(['like', 'service_id', $this->service_id])
            ->andFilterWhere(['like', 'description', $this->description]);
     
//         echo $query -> createCommand() -> getRawSql();
        return $dataProvider;
    }
}
