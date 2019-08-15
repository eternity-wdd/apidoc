<?php

namespace app\modules\admin\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\ApiDomain;

/**
 * ApiDomainSearch represents the model behind the search form about `app\modules\admin\models\ApiDomain`.
 */
class ApiDomainSearch extends ApiDomain
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['system_id', 'name', 'env', 'domain'], 'safe'],
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
        $query = ApiDomain::find();

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
        ]);

        $query->andFilterWhere(['like', 'system_id', $this->system_id])
            ->andFilterWhere(['like', 'env', $this->env])
            ->andFilterWhere(['like', 'name', $this->domain])
            ->andFilterWhere(['like', 'domain', $this->domain]);

        return $dataProvider;
    }
}
