<?php
namespace app\controllers;

use app\models\Api;
use app\models\ApiGroup;
use app\models\ApiClient;
use app\models\ApiParam;
use common\helpers\NetworkHelper;
use common\helpers\MenuHelper;

class SandboxController extends \yii\web\Controller
{
    public function actionPurchaser()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('purchaser'),
        ]);
    }
    
    public function actionOfficial()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('official'),
        ]);
    }
    
    public function actionOfficialweb()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('officialweb'),
        ]);
    }
    
    public function actionInner()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('inner'),
        ]);
    }
    
    public function actionSupplier()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('supplier'),
        ]);
    }
    
    public function actionCrmOpenapi()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('official'),
        ]);
    }
    
    public function actionStandard()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('standard'),
        ]);
    }
    public function actionDatamap()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('datamap'),
        ]);
    }
    public function actionDeliver()
    {
        return $this->render('purchaser', [
            'apis' => $this->apis('deliver'),
        ]);
    }
    public function actionTradeApi()
    {
        //purchaser
        return $this->render('dan', [
            'apis' => $this->apis('trade-api'),
        ]);
    }
    public function actionFacility()
    {
        //purchaser
        return $this->render('dan', [
            'apis' => $this->apis('facility'),
        ]);
    }
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
                    $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="'.$v['val'].'" />　(必填)</div>';
                }else{
                    $html.='<div><label>'.$v['label'].'：</label> <input type="text" name="param['.$v['name'].']" value="'.$v['val'].'" /></div>';
                }
            }else if($v['showtype']=='2'){
                if($v["request"]=="1"){
                    $html.='<div><label class="mylabel">'.$v['label'].'：</label> <textarea class="mytext" type="text" name="param['.$v['name'].']" /></textarea>　(必填)</div>';
                }else{
                    $html.='<div><label class="mylabel">'.$v['label'].'：</label> <textarea class="mytext" type="text" name="param['.$v['name'].']" /></textarea> </div>';
                }
            }else if($v['showtype']=='3'){
                $html.='<div><label>'.$v['label'].'：</label>';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.=' <input type="checkbox" name="param['.$v['name'].']" value="'.$k2.'" /> '.$v2;
                }
                if($v["request"]=="1"){
                    $html.='　　(必选)</div>';
                }else{
                    $html.='</div>';
                }                
            }else if($v['showtype']=='4'){
                $html.='<div><label>'.$v['label'].'：</label>';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.=' <input type="radio" name="param['.$v['name'].']" value="'.$k2.'"  if($k2==k2){ checked }/>'.$v2;
                }
                if($v["request"]=="1"){
                    $html.='　(必选)</div>';
                }else{
                    $html.='</div>';
                }
            }else if($v['showtype']=='5'){
                $html.='<div><label>'.$v['label'].'：</label> ';
                $html.='<select name="param['.$v['name'].']">';
                foreach (json_decode($v['param_cont']) as $k2=>$v2){
                    $html.='<option value ="'.$k2.'">'.$v2.'</option>';
                }
                if($v["request"]=="1"){
                    $html.='</select>　(必选)</div>';
                }else{
                    $html.='</select></div>';
                }
            }
        }
        return $html; 
    }
    
    public function actionRequest()
    {
/*         $client = ApiClient::findOne(\Yii::$app->request->post('appid'));
       
        if(!$client || $client->appkey == \Yii::$app->request->post('secret'))
        {
            
        }
        
        if(!empty($_REQUEST['secret']) && $appkey != $_REQUEST['secret'])
        {
            OpenApiResponse::error(OpenApiError::SIGNATURE_ERROR, 'secret error');
            exit();
        } */
        $appkey = \Yii::$app->request->post('secret') . '&';
        $data =  \Yii::$app->request->post('param');
        $api = Api::findOne($data['api']);
        if(!$api) echo '<h3>接口不存在</h3>';
        
        $data['api'] = $api->name;
        $data['appid'] = \Yii::$app->request->post('appid');
        $data['t'] = time();
        
        ksort($data);
//         echo "<pre>";print_r($data);exit();
        $notSignParams = explode(',', $api->not_sign_params);
        $sigStr = '';
        foreach($data as $key=>$item)
        {
            if(!in_array($key, $notSignParams))
            {
                $sigStr .= '&'.$key.'='.$item;
            }
        }
//         $sigStr = urldecode('&'.http_build_query($data));
        
        $data['s'] = base64_encode(hash_hmac('sha1', urlencode($sigStr), strtr($appkey, '-_', '+/'), true));
//        echo "<pre>";print_r(\Yii::$app->params['api'][$api->module_id]);exit();
        $ret = NetworkHelper::makeRequest(\Yii::$app->params['api'][$api->module_id]['domain'].'/'.$api->name, $data);
        //(\Yii::$app->params['api'][$api->module_id]['domain'], $data)
        echo '<br /><br />返回结果：<br /><br /><pre>'.$ret['msg'].'</pre>';
        echo '<h2>1、 构造源串</h2>';
        echo '源串：'.$sigStr.'<br />';
        echo 'URL编码后：'.$sigStr.'<br />';
        
        echo '<h2>2、构造密钥</h2>'.$appkey.'<br />';
        
        echo '<h2>3、生成签名值</h2>';
        echo "签名函数(PHP代码)：hash_hmac('sha1', urlencode(\"".$sigStr."\"), strtr(\"".$appkey."\", '-_', '+/'), true)<br />";
        echo '签名值：'.$data['s'].'<br /><br /><br />';
        
        echo '请求URL演示：<br />http://'.\Yii::$app->params['api'][$api->module_id]['domain'].'?'.NetworkHelper::makeQueryString($data);
        
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
            -> leftJoin(ApiGroup::tableName().' group', Api::tableName().'.group_id = group.id')
            -> where([Api::tableName().'.module_id'=> $module])
            -> orderBy('group.priority desc, priority desc')
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