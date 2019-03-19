<?php

namespace app\modules\manage\controllers;

use Yii;
use app\models\ApiParam;
use app\models\ApiParamSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Api;

/**
 * ApiParamController implements the CRUD actions for ApiParam model.
 */
class ApiParamController extends BaseController
{
    public $layout ="main1";
    
    /* public function beforeAction($action)
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
     * Lists all ApiParam models.
     * @return mixed
     */
    public function actionIndex()
    {
        $api_id = \Yii::$app->request->get('api');
        $model = Api::findOne($api_id);
        

        
        /*  $res = (new \yii\db\Query())
        ->select('t2.label')
        ->from('xm_api t1')
        ->leftjoin('xm_api_module t2', 't1.module_id=t2.name')
        ->where('t1.id=:id', array(':id'=>$api_id))
        ->one(); 
         var_dump($res); */
       
        
        $searchModel = new ApiParamSearch();
        $searchModel->api_id = \Yii::$app->request->get('api');
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'api' => $searchModel->api_id,
            'model' =>$model,
        ]);
    }

    /**
     * Displays a single ApiParam model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new ApiParam model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ApiParam();
        $model->api_id = Yii::$app->request->get('api');
        
        /*  var_dump(Yii::$app->request->post());exit();  */
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing ApiParam model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing ApiParam model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $api_id = ApiParam::find()->select(['api_id'])->where(['id'=>$id])->one();
        $this->findModel($id)->delete();
        
        return $this->redirect(['index','api'=>$api_id['api_id']]);
    }

    /**
     * Finds the ApiParam model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ApiParam the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ApiParam::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
