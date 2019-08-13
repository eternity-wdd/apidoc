<?php

namespace app\modules\admin\controllers;

use app\modules\admin\models\ApiParam;
/**
 * ApiParamInController implements the CRUD actions for ApiParam model.
 */
class ApiParamInController extends ApiParamController
{
    /**
     * Creates a new ApiParam model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ApiParam();
        $model->api_id = \Yii::$app->request->get('api');
        $model->priority = 5;
        $model->request = 1;
        
        if ($model->load(\Yii::$app->request->post())) 
        {
            $model->out = 0;
            if($model->save())
            {
                return $this->redirect(['api/view', 'id' => $model->api_id]);
            }
        }
        
        return $this->render('create', [
            'model' => $model,
        ]);
    }
}