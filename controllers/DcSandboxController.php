<?php
namespace app\controllers;

use app\modules\admin\models\Api;
use app\modules\admin\models\ApiClient;
use app\modules\admin\models\ApiDomain;
use app\modules\admin\models\ApiParam;
use app\modules\admin\models\ApiService;
use common\helpers\BaseData;
use common\helpers\NetworkHelper;
use common\helpers\MenuHelper;

class DcSandboxController extends \yii\web\Controller
{
    /**
     * 修改为响应式渲染
     * @return string
     * User: LiZheng  271648298@qq.com
     * Date: 2019/5/18
     */
    public function actionIndex()
    {
        $service_id = \Yii::$app->request->getQueryParam('service_id');
        $system_id = ApiService::find()->select('system_id')->where(['name'=> $service_id])->asArray()->one();
        $clients = ApiClient::find()
            -> select("distinct(name), from")
            -> orderBy('name DESC')
            -> asArray()
            ->all();
        $systems = ApiDomain::find()
            -> select(" distinct(system_id), name, type")
            -> orderBy('system_id DESC')
            -> asArray()
            ->all();
        $type = array_column($systems,'type', 'system_id');
        $services = ApiService::find()
            -> select(" distinct(system_id), name, service_url, label")
            -> where(['system_id'=>$system_id['system_id']])
            -> orderBy('name DESC')
            -> asArray()
            ->all();
        return $this->render('dan', [
            'apis' => $this->apis($service_id),
            'clients' => $clients,
            'systems' => $systems,
            'services' => $services,
            'system_id' => $system_id['system_id'],
            'type' => $type[$system_id['system_id']],
            'service_id' => $service_id,
        ]);
    }
    //获取content-type
    public function actionGettype()
    {
        $system_id = $_POST['system_id'];
        $res = ApiDomain::find()->select('type')->where(['system_id'=> $system_id])->asArray()->one();
        return json_encode($res, true);
    }
    //ajax获取服务下拉框
    public function actionGetservice()
    {
        $old_service_id = $_POST['service_id'];
        $res = ApiService::find()->where(['system_id'=> $_POST['system_id']])->orderBy(["name"=>SORT_DESC])->asArray()->all();
//        $sql = clone $res;
//        echo "<pre>";var_dump($sql->createCommand()->getRawSql());exit;
        $html = "<input type=\"hidden\" id=\"old-service-id\" value=\"{$old_service_id}\">
        <label>服务模块:</label>
        <select style='height:30px; width: 200px; ' id=\"api-service-selector\" type=\"select\" name=\"service_id\">";
        $html .= "<option>选择服务</option>";
        foreach ($res as $key => $val)
        {
            $html .= "<option value='".$val['name']."' ";
            if($val['name'] == $old_service_id)
            {
                $html .= 'select ';
            }
            $html .= '>'.$val['label']." </option>";
        }
        $html .= "</select>";
        return $html;
    }
    public function actionGetclientid()
    {
        $params = $_POST;
        $res = ApiClient::find()->select('client_id, secret')
            ->where(['system_id'=> $params['system'],'env'=>$params['env'],'from'=>$params['client']])
            ->asArray()->one();

        return json_encode($res, true);
    }
//    public function actionTradeApi()
//    {
//        //purchaser
//        return $this->render('dan', [
//            'apis' => $this->apis('trade-api'),
//        ]);
//    }
//    public function actionFacility()
//    {
//        //purchaser
//        return $this->render('dan', [
//            'apis' => $this->apis('facility'),
//        ]);
//    }
    /**
     * 获取接口的相关参数表单字段
     * @param int $id 接口ID
     * @return string
     */
    public function actionParams($id)
    {
        $api = Api::findOne($id);
        $view = 'api/' . $api->module_id . '/' . str_replace('/', '_', $api->name);
        return $this->renderPartial($view);
    }

    //ajax获取参数html
    public function actionGethtml()
    {
        $res = ApiParam::find()->where(['api_id'=> $_POST['zhi'],'out'=>'0'])->orderBy(["priority"=>SORT_DESC])->asArray()->all();
        $url = Api::findOne($_POST['zhi']);
        $html = "";
        $html.='<div><label>'.'URL'.'：</label> <input type="text" readonly="true" value="'.$url['name'].'" /></div>';
        foreach($res as $k=>$v){
//             if($v['request']=='1'){
//                 $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="" /> (必填)</div>';
//             }else{
//                 $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="" /> </div>';
//             }
            
            if($v['showtype']=='1'){
                if($v["request"]=="1"){
                    $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="'.$v['val'].'" />　(必填)<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }else{
                    $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="'.$v['val'].'" /><span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }
            }else if($v['showtype']=='2'){
                if($v["request"]=="1"){
                    $html.='<div><label class="mylabel">'.$v['label'].'：</label> <textarea class="mytext" type="text" name="param['.$v['name'].']" /></textarea>　(必填)<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }else{
                    $html.='<div><label class="mylabel">'.$v['label'].'：</label> <textarea class="mytext" type="text" name="param['.$v['name'].']" /></textarea><span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }
            }else if($v['showtype']=='3'){
                $html.='<div><label>'.$v['label'].'：</label>';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.=' <input type="checkbox" name="param['.$v['name'].']" value="'.$k2.'" /> '.$v2;
                }
                if($v["request"]=="1"){
                    $html.='　　(必选)<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }else{
                    $html.='<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }                
            }else if($v['showtype']=='4'){
                $html.='<div><label>'.$v['label'].'：</label>';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.=' <input type="radio" name="param['.$v['name'].']" value="'.$k2.'"  if($k2==k2){ checked }/>'.$v2;
                }
                if($v["request"]=="1"){
                    $html.='　(必选)<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }else{
                    $html.='<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }
            }else if($v['showtype']=='5'){
                $html.='<div><label>'.$v['label'].'：</label> ';
                $html.='<select name="param['.$v['name'].']">';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.='<option value ="'.$k2.'">'.$v2.'</option>';
                }
                if($v["request"]=="1"){
                    $html.='</select>　(必选)<span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }else{
                    $html.='</select><span style="font-weight: bold">（'.$v['name'].'）</span></div>';
                }
            }
        }
        return $html; 
    }
    
    public function actionRequest()
    {
        $system_id = \Yii::$app->request->post('system_id');
        $service_id = \Yii::$app->request->post('service_id');
        $env = \Yii::$app->request->post('env');
        $system = ApiDomain::find()->where(['system_id'=>$system_id, 'env'=>$env])->asArray()->one();
        $type = $system['type'];
        $domain = $system['domain'];
        $protocol = substr($domain,0,5);
        if($protocol != 'https')
        {
            $protocol = 'http';
        }
        $api = Api::findOne(\Yii::$app->request->post('api_url'));
        if(!$api) echo '<h3>接口不存在</h3>';
        $cookie = '';
        if($service_id)
        {
            $domain = $domain.'/'.$service_id;
        }
        $domain .= '/'.$api['name'];

        $data =  \Yii::$app->request->post('param');
        if($api['method'] == 1)
        {
            $method = 'post';
        }elseif($api['method'] == 2)
        {
            $method = 'get';
        }else
        {
            $method = 'post';
        }

//        echo "<pre>";print_r(\Yii::$app->params['api'][$api->module_id]);exit();
//        $ret = NetworkHelper::makeRequest(\Yii::$app->params['api'][$api->module_id]['domain'].'/'.$api->name, $data);//替换为响应式
        $ret = BaseData::makeRequest($domain, $data, $cookie , $method, $protocol);
        //(\Yii::$app->params['api'][$api->module_id]['domain'], $data)
        echo '<br /><br />返回结果：<br /><br /><pre>'.$ret['msg'].'</pre>';
        echo '<h2>1、 构造源串</h2>';

        echo '请求URL演示：<br />http://'.$domain.'?'.NetworkHelper::makeQueryString($data);
        
    }

    /**
     * 选择模块（应用）
     * @param $module
     * @return array
     * User: LiZheng  271648298@qq.com
     * Date: 2019/3/24
     */
    private function apis($module)
    {
        $data = Api::find()
            ->select('dc_api.*, service.service_url')
            -> leftJoin(ApiService::tableName().' service', Api::tableName().'.service_id = service.name')
            -> where(['service.name'=> $module])
            -> orderBy('service.name, priority desc')
            -> asArray()
            ->all();
        return $data;
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