<?php
/**
 * 权限验证
 * User: Zhangyue
 * Date: 2016/9/1
 * Time: 8:36
 */
namespace app\modules\manage\controllers;

use Yii;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;

class BaseController extends Controller{
    public function beforeAction($action)
    {
        if(!\Yii::$app->user->identity){
            $this->redirect(['default/login']);
            return false;
        }
        //$controller=$action->controller->id;
        //总管理员不验证权限了,site不继承该类，所以site下方法无权限管理
        if (Yii::$app->user->identity->id==1||\Yii::$app->user->can('总管理员')) {
            return true;
        }
        $m= $action->controller->id."/".$action->id;
        //检查用户是否可以执行指定的操作许可。
       // var_dump($m);
        $can=\Yii::$app->user->can($m);
        //var_dump($can);exit;
        if ($can) {
            return true;
        }else{
            throw new ForbiddenHttpException('您没有权限');
            return false;
        }
    }
    
    //格式化打印
    function dump($vars, $label = '', $return = false)
    {
        if (ini_get('html_errors')) {
            $content = "<pre>\n";
            if ($label != '') {
                $content .= "<strong >{$label} :</strong>\n";
            }
            $content .= htmlspecialchars(print_r($vars, true));
            $content .= "\n</pre>\n";
        } else {
            $content = $label . " :\n" . print_r($vars, true);
        }
        if ($return) { return $content; }
        echo $content;
        return null;
    }
}