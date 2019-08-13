<?php

namespace app\modules\admin\controllers;

use app\modules\admin\models\ApiGroup;
use app\modules\admin\models\ApiService;
use Yii;
use app\modules\admin\models\Api;
use app\modules\admin\models\ApiSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\modules\admin\models\ApiParam;
use yii\helpers\Html;
use app\modules\admin\models\ApiClientPlatform;
use app\modules\admin\models\ApiParamType;

/**
 * 接口控制器
 * ApiController implements the CRUD actions for Api model.
 */
class ApiController extends BaseController
{
    
   /*  public function beforeAction($action)
    {       
        if (!Yii::$app->user->identity) {
            $this->redirect(['default/login']);
            return false;
        } else {
            return true;
        }
    } */
    
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Api services.  所有的服务(模块)列表
     * @return string
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionIndex()
    {
        $services = ApiService::find()->all();
        $this->layout = "main1";

        return $this->render('index', [
            'services' => $services
        ]);
    }

    /**
     * 所有的接口列表
     * @return string
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionList()
    {
        $search = $_GET['ApiSearch'];
        $this->layout = "main1";
        $service = ApiService::find()->asArray()->all();
        $searchModel = new ApiSearch();
        $searchModel->load(Yii::$app->request->queryParams, '');
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        if($search&&!empty($search['service_id']))
        {
            $dataProvider->query->andWhere(['service_id'=>$search['service_id']]);
        }
        if($search&&!empty($search['name']))
        {
            $dataProvider->query->andFilterWhere(['like', 'name', $search['name']]);
        }
        if($search&&!empty($search['label']))
        {
            $dataProvider->query->andFilterWhere(['like', 'label', $search['label']]);
        }
        return $this->render('list', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'service' =>$service,
            'search' =>$search,
        ]);
    }
    
    //ajax动态获取搜索栏
    public function actionGettag()
    {
       $res = $_POST['zhi'];
       $tag = ApiGroup::find()->where(['service_id'=>$res])->orderBy(["priority"=>SORT_ASC])->all();
       $aa = '请选择';
       $result=Html::tag('option',$aa, ['value'=>'empty']);
       foreach($tag as $value=>$name)
       {
          //  $str.=Html::tag('option',Html::encode($name['name']),array('value'=>$name['id']));
            $result .= Html::tag('option',Html::encode($name['name']),array('value'=>$name['id']));
            $result .= '<li class="option-item" data-index="'.$name['id'].'" data-value="'.$name['id'].'">'.$name['name'].'</li>';
            
       }
       echo $result;
    }
    
    //ajax动态获取
    public function actionGetplatforms()
    {
        $res = $_POST['zhi'];
        file_put_contents("d:lizheng.log", "\n post \n".print_r($res,true));
        $rows = ApiClientPlatform::find()->where(['service_id'=>$res])->all();
        file_put_contents("d:lizheng.log", "\n rows \n".print_r($rows,true), 8);
        $options = [];
        $data = '';
        foreach ($rows as $row)
        {
            $options[] = array('k'=>(string)$row['bit'], 'v'=>$row['name']);
        }
//        echo "<pre>";var_dump($options);exit;
         foreach($options as $k=>$v)
        {
           $data.='<label><input type="checkbox" name="Api[platforms][]" value="'.$v['k'].'"> '.$v['v'].'</label>　';
        }
        file_put_contents("d:lizheng.log", "\n data \n".print_r($data,true), 8);
         echo $data; exit;  //这里直接向js输出
//        echo "<pre>";var_dump($options);exit;
        return json_encode($options, true);
    }

    /**
     * ajax获取分组
     * User: LiZheng  271648298@qq.com
     * Date: 2019/5/10
     */
    public function actionGetgroups()
    {
        $service_id = $_POST['service_id'];
        $groups = ApiGroup::find()->where(['service_id'=>$service_id])->all();
        $data['option'] = '<option value>请选择</option>';
        $data['item'] = "<li class='option-item option-selected option-hover' data-index='0' data-value>请选择</li>";
        $i = 1;
        foreach ($groups as $group)
        {
            $data['item'] .= "<li class='option-item' data-index={$i} data-value={$group['id']}>{$group['name']}</li>";
            $i ++;
            $data['option'] .= "<option value={$group['id']}>{$group['name']}</option>";
        }
        return json_encode($data, true);
        echo $data; exit;  //这里直接向js输出
    }

    /**
     * 查看接口详情
     * @param $id
     * @return string
     * @throws NotFoundHttpException
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionView($id)
    {
        $this->layout = "main1";
        $model = $this->findModel($id);
        $service = Api::find()->select(['service_id'])->where(['id'=>$id])->one();

        $params = ApiParam::find()->where(['api_id'=>$id])->all();
        if(($model->platforms & 1) >0)
        {
            $type_display [0]= 1;
        }
        if(($model->platforms & 2) >0)
        {
            $type_display [1]= 2;
        }
        if(($model->platforms & 4) >0)
        {
            $type_display [2]= 4;
        }
        if(($model->platforms & 8) >0)
        {
            $type_display [3]= 8;
        }
        if(($model->platforms & 16) >0)
        {
            $type_display [4]= 16;
        }
        if(($model->platforms & 32) >0)
        {
            $type_display [5]= 32;
        }
        if(($model->platforms & 64) >0)
        {
            $type_display [6]= 64;
        }
        if(($model->platforms & 128) >0)
        {
            $type_display [7]= 128;
        }
        
//         $model->platforms=$type_display;
//        echo "<pre>";var_dump($model, $service, $params, $type_display);exit;
        return $this->render('view', [
            'model' => $model,
            'service'=>$service,
            'params'=>$params,
            'type_display'=>$type_display,
        ]);
    }

    /**
     * 添加接口
     * @return string|\yii\web\Response
     * @throws \yii\db\Exception
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionCreate()
    {
        $this->layout = "main1";
        $service = \Yii::$app->request->get('service_id');
        $params_type = ApiParamType::find()->asArray()->all();
        $model = new Api(); 
        $model->service_id = $service;
        $model->version = '1';
        $model->priority = '50';
        $model->method = '1';
        $model->publish = '1';
        $model->platforms = '0';
        $params = Yii::$app->request->post();
        if ($model->load(Yii::$app->request->post()) && $model->validate())
        {
            $platforms = 0;
            if($params['Api']['platforms'])
            {
                foreach ($params['Api']['platforms'] as $k =>$v)
                {
                    $platforms |= $v;  
                }
            }
            $model->platforms = $platforms;
            $methods = 0;
            if($params['Api']['method']){
                foreach ($params['Api']['method'] as $k =>$v)
                {
                    $methods |= $v;
                }
            }
            $model->method = $methods;
            $outerTransaction = Yii::$app->db->beginTransaction();
            try {
                if($model->save()) {
                    if($params['cs_name']){
                        //拼接参数详情
                        if($params['showval']){
                            $arr = [];
                            foreach ($params['showval'] as $k=>$v){
                                foreach ($params['showlabel'] as $key=>$val){
                                    if($k==$key){
                                        $array=[];
                                        foreach ($v as $k2=>$v2){
                                            foreach ($val as $key2=>$val2){
                                                if($k2==$key2){
                                                    $array[$v2] = $val2;
                                                    $arr[$k] = $array;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        $cs_request = array_merge($params['cs_request']);
                        foreach($params['cs_name'] as $k=>$v){
                            $param_model = new ApiParam();
                            $param_model->api_id = $model->id;
                            $param_model->name = $params['cs_name'][$k];
                            $param_model->label = $params['cs_label'][$k];
                            $param_model->val = $params['cs_val'][$k];
                            $param_model->request = $cs_request[$k];
                            $param_model->pt_id = $params['cs_pt'][$k];
                            $param_model->out = 0;
                            $param_model->priority = $params['cs_priority'][$k];
                            $param_model->desc = $params['cs_desc'][$k];
                            $param_model->showtype = $params['cs_showtype'][$k];
                            if($params['cs_showtype'][$k]=='1' || $params['cs_showtype'][$k]=='2'){
                                $param_model->param_cont= 0;
                            }else{
                                $param_model->param_cont = json_encode($arr[$params['cs_name'][$k]],JSON_UNESCAPED_UNICODE);
                            }
//                             self::dump($param_model);exit;
                            if(!$param_model->save()){
                                $outerTransaction->rollBack();
                                echo "<script>alert('失败1');history.back()</script>";exit;
                            }
                        }
//                         exit;
                    }
                    if($params['re_name']){
                        $re_request = array_merge($params['re_request']);
                        foreach($params['re_name'] as $k=>$v){
                            $param_model2 = new ApiParam();
                            $param_model2->api_id = $model->id;
                            $param_model2->name = $params['re_name'][$k];
                            $param_model2->label = $params['re_label'][$k];
                            $param_model2->request = $re_request[$k];
                            $param_model2->pt_id = $params['re_pt'][$k];
                            $param_model2->out = 1;
                            $param_model2->priority = $params['re_priority'][$k];
                            $param_model2->desc = $params['re_desc'][$k];
                            $param_model2->showtype = '0';
                            $param_model2->param_cont = '';
                            if(!$param_model2->save()){
                                $outerTransaction->rollBack();
                                echo "<script>alert('失败3');history.back()</script>";exit;
                            }
                        }
                    }                   
                }
                $outerTransaction->commit();
                return $this->redirect(['list', 'id' => $model->id]);
            }catch (\Exception $e) {
                echo $e ->getMessage();exit;
                $outerTransaction->rollBack();
                echo "<script>alert('接口表添加失败，请重新填写');history.back()</script>";
            }
        } else {
            return $this->render('create', [
                'model' => $model,
                'service'=> $service,
                'params_type'=>$params_type,//参数所有类型
            ]);
        }
    }

    /**
     * 更新
     * @param $id
     * @return string|\yii\web\Response
     * @throws \yii\db\Exception
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionUpdate($id)
    {
        $this->layout = "main1";
        $params = Yii::$app->request->post();
        $params_type = ApiParamType::find()->asArray()->all();
        $service_id = Api::find()->select(['service_id'])->where(['id' => $id])->one();
        $service = $service_id['service_id'];
        $params_model = ApiParam::find()->where(['api_id'=>$id])->orderBy('priority')->asArray()->all();
        
        $model = Api::findOne($id);  
        if ($model->load(Yii::$app->request->post()) && $model->validate())
        {
//            self::dump($params);
//            self::dump($params);exit;
          $platforms = 0;
            
            if($params['Api']['platforms'])
            {
                foreach ($params['Api']['platforms'] as $k =>$v)
                {
                    $platforms |= $v;  
                }
            }
            
            $model->platforms = $platforms;
            $methods = 0;
            if($params['Api']['method']){
                foreach ($params['Api']['method'] as $k =>$v)
                {
                    $methods |= $v;
                }
            }
            
            $model->method = $methods;
            
            $outerTransaction = Yii::$app->db->beginTransaction();         
            try {
                if($model->save()) {
                    if($params['cs_name']){
                        //拼接参数详情
                        if($params['showval']){
                            $arr = [];
                            foreach ($params['showval'] as $k=>$v){
                                foreach ($params['showlabel'] as $key=>$val){
                                    if($k==$key){
                                        $array=[];
                                        foreach ($v as $k2=>$v2){
                                            foreach ($val as $key2=>$val2){
                                                if($k2==$key2){
                                                    $array[$v2] = $val2;
                                                    $arr[$k] = $array;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        ApiParam::deleteAll(['api_id'=>$id,'out'=>'0']);
                        
                        $cs_request = array_merge($params['cs_request']);
                        foreach($params['cs_name'] as $k=>$v){
                            $param_model = new ApiParam();
                            $param_model->api_id = $id;
                            $param_model->name = $params['cs_name'][$k];
                            $param_model->label = $params['cs_label'][$k];
                            $param_model->val = $params['cs_val'][$k];
                            $param_model->request = $cs_request[$k];
                            $param_model->pt_id = $params['cs_pt'][$k];
                            $param_model->out = 0;
                            $param_model->priority = $params['cs_priority'][$k];
                            $param_model->desc = $params['cs_desc'][$k];
                            $param_model->showtype = $params['cs_showtype'][$k];
                            if($params['cs_showtype'][$k]=='1' || $params['cs_showtype'][$k]=='2'){
                                $param_model->param_cont= 0;
                            }else{
                                $param_model->param_cont = json_encode($arr[$params['cs_name'][$k]],JSON_UNESCAPED_UNICODE);
                            }
                            if(!$param_model->save()){
                                $outerTransaction->rollBack();
                                echo "<script>alert('输入参数修改失败');history.back()</script>";exit;
                            }
                        }
                    }
                    if($params['re_name']){
                        ApiParam::deleteAll(['api_id'=>$id,'out'=>'1']);
                        $re_request = array_merge($params['re_request']);
                        foreach($params['re_name'] as $k=>$v){
                            $param_model2 = new ApiParam();
                            $param_model2->api_id = $id;
                            $param_model2->name = $params['re_name'][$k];
                            $param_model2->label = $params['re_label'][$k];
                            $param_model2->request = $re_request[$k];
                            $param_model2->pt_id = $params['re_pt'][$k];
                            $param_model2->out = 1;
                            $param_model2->priority = $params['re_priority'][$k];
                            $param_model2->desc = $params['re_desc'][$k];
                            $param_model2->showtype = '0';
                            $param_model2->param_cont = '';
                            if(!$param_model2->save()){
                                $outerTransaction->rollBack();
                                echo "<script>alert('输出参数修改失败');history.back()</script>";exit;
                            }
                        }
                    }                   
                }
                $outerTransaction->commit();
                return $this->redirect(['view', 'id' => $model->id]);
            }catch (\Exception $e) {
                $outerTransaction->rollBack();
                echo "<script>alert('接口修改失败，请重新填写');history.back()</script>";
            }
        }
//        self::dump($params_type);exit;
        return $this->render('update', [
            'model' => $model,
            'service' =>$service,//默认哪个属于哪个模块
            'params_model'=> $params_model,
            'params_type'=>$params_type,//参数所有类型
        ]);
    }

    /**
     * 删除接口
     * @param $id
     * @return \yii\web\Response
     * @throws NotFoundHttpException
     * @throws \yii\db\StaleObjectException
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionDelete($id)
    {
        $this->layout = "main1";
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Api model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Api the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Api::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
