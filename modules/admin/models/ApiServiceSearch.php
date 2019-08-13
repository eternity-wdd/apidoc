<?php

namespace app\modules\admin\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\ApiService;

/**
 * ApiServiceSearch represents the model behind the search form about `app\modules\admin\models\ApiService`.
 */
class ApiServiceSearch extends ApiService
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'label', 'system_id', 'service_url'], 'safe'],
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
        $query = ApiService::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'label', $this->label])
            ->andFilterWhere(['like', 'system_id', $this->system_id])
            ->andFilterWhere(['like', 'service_url', $this->service_url]);

        return $dataProvider;
    }
}
