<?php

namespace app\modules\manage\controllers;

use Yii;
use app\models\Api;
use app\models\ApiSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\ApiModule;
use app\models\ApiGroup;
use app\models\ApiParam;
use yii\helpers\Html;
use app\models\ApiClientPlatform;
use app\models\ApiParamType;

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
     * Lists all Api modules.  所有的应用(模块)列表
     * @return string
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/10
     */
    public function actionIndex()
    {
        $modules = ApiModule::find()->all();
        $this->layout = "main1";
        return $this->render('index', [
            'modules' => $modules
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
        $res = ApiGroup::find()->select(['id','name'])->asArray()->all();
        $module = ApiModule::find()->asArray()->all();

        $searchModel = new ApiSearch();
        $searchModel->load(Yii::$app->request->queryParams, '');
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        if($search&&!empty($search['module_id']))
        {
            $dataProvider->query->andWhere(['module_id'=>$search['module_id']]);
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
            'options'=>$res,
            'module' =>$module,
            'search' =>$search,
        ]);
    }
    
    //ajax动态获取搜索栏
    public function actionGettag()
    {
       $res = $_POST['zhi'];
       $tag = ApiGroup::find()->where(['module_id'=>$res])->orderBy(["priority"=>SORT_ASC])->all();
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
        $rows = ApiClientPlatform::find()->where(['module_id'=>$res])->all();
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
         echo $data; exit;  //这里直接向js输出
//        echo "<pre>";var_dump($options);exit;
        return json_encode($options, true);
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
        $module = Api::find()->select(['module_id'])->where(['id'=>$id])->one();
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
        
//         self::dump($type_display);
//         $model->platforms=$type_display;
        
        return $this->render('view', [
            'model' => $model,
            'module'=>$module,
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
        $module = \Yii::$app->request->get('module_id');
        $params_type = ApiParamType::find()->asArray()->all();
        $model = new Api(); 
        $model->module_id = $module;
        $model->version = '1';
        $model->priority = '50';
        $model->method = '1';
        $model->publish = '1';
        $model->platforms = '0';
        $params = Yii::$app->request->post();
          
        if ($model->load(Yii::$app->request->post()) && $model->validate())
        {
//            self::dump($params_type);
            
//             self::dump($params);exit;
            
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
            
//             self::dump($model->getErrors());exit;
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
                return $this->redirect(['view', 'id' => $model->id]);
            }catch (\Exception $e) {
                $outerTransaction->rollBack();
                echo "<script>alert('接口表添加失败，请重新填写');history.back()</script>";
            }
        } else {
            
            return $this->render('create', [
                'model' => $model,
                'module'=> $module,
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
        $module_id = Api::find()->select(['module_id'])->where(['id' => $id])->one();
        $module = $module_id['module_id'];
        $params_model = ApiParam::find()->where(['api_id'=>$id])->asArray()->all();
        
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
            'module' =>$module,//默认哪个属于哪个模块
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
