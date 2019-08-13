<?php

namespace app\modules\admin\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\admin\models\ApiParam;

/**
 * ApiParamSearch represents the model behind the search form about `app\modules\admin\models\ApiParam`.
 */
class ApiParamSearch extends ApiParam
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'api_id', 'pt_id', 'request', 'out', 'priority'], 'integer'],
            [['name', 'desc'], 'safe'],
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
       
        if(!empty($params['ApiParamSearch']['pt_id'])){
            if($params['ApiParamSearch']['pt_id'] == "string"){
                $params['ApiParamSearch']['pt_id'] = '1';
            }elseif ($params['ApiParamSearch']['pt_id'] == "int"){
                $params['ApiParamSearch']['pt_id'] = '2';
            }elseif ($params['ApiParamSearch']['pt_id'] == "float"){
                $params['ApiParamSearch']['pt_id'] = '3';
            }elseif ($params['ApiParamSearch']['pt_id'] == "varchar"){
                $params['ApiParamSearch']['pt_id'] = '4';
            }
        }
        $query = ApiParam::find();

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
            'api_id' => $this->api_id,
            'pt_id' => $this->pt_id,
            'request' => $this->request,
            'out' => $this->out,
            'priority' => $this->priority,
        ]);
        
        if ($_GET['button-from'] == 'input'){
            $query->andWhere(['out' => '0']);
        }elseif ($_GET['button-from'] == 'output'){
            $query->andWhere(['out' => '1']);
        }
        $query->andFilterWhere(['like', 'desc', $this->desc]);
//         ->andFilterWhere(['like', 'name', $this->name])
            /* ->andWhere([]); */
            /* ->andWhere(['id' => $_GET['api']]); */
        return $dataProvider;
    }
}
