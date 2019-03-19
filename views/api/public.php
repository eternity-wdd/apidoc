<?php
use app\models\Api;
use app\models\XmApiPublic;
?>
<!--名称-->
<h2 class="fixmt"><?= $api->name;?></h2>
<div class="contentSub">
    <div id="bodyContent">
        <table id="toc" class="toc" summary="目录">
            <tbody>
                <tr>
                    <td>
                        <div id="toctitle">
                            <h2>目录</h2> 
                            <span class="toctoggle">
                                [<a id="togglelink" class="internal" href="javascript:toggleToc()">隐藏</a>]
                            </span>
                        </div>
                        <ul>
                            <li class="toclevel-1"><a href="#What.27s_New.1F"><span class="tocnumber">1</span> <span class="toctext">公共输入参数说明</span></a></li>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
        <a name="What.27s_New.1F"></a>
        <h2> <span class="mw-headline">1.公共参数说明</span></h2>
        <p><?= $api->label;?><br></p>   
        <a name="1_.E5.8A.9F.E8.83.BD.E8.AF.B4.E6.98.8E"></a>
        
        <h3><span class="mw-headline">1.1输入参数说明<br></span></h3>
        <table class="t">
            <tbody>
                <tr>
                    <th ><b>参数名称</b></th>
                    <th ><b>是否必须</b></th>
                     <th ><b>类型</b></th>
                      <th ><b>描述</b></th>
                </tr>
                <?php foreach ($code as $param):?>
                <tr>
                    <td > <b><?= $param->paramname;?></b></td>
                    <td>  <?= $param->require;?></td>
                    <td width=80><?= $param->type;?></td>
                    <td><?= $param->des;?></td>
                </tr>
                <?php endforeach;?>
            </tbody>
        </table>
        
        <a name="3_.E7.A4.BA.E4.BE.8B.E4.BB.A3.E7.A0.81" id="3_.E7.A4.BA.E4.BE.8B.E4.BB.A3.E7.A0.81"></a>
        <!-- 
        <h2> <span class="mw-headline">3 示例代码</span></h2>
        <p>您可以直接下载并使用腾讯开放平台提供的SDK，并参考SDK里面的给出的示例代码进行接口调用。<br>
            详见：
            <a href="/wiki/SDK%E4%B8%8B%E8%BD%BD#OpenAPI_V3.0_SDK.E4.B8.8B.E8.BD.BD" title="SDK下载">SDK下载#OpenAPI V3.0 SDK下载</a>。
        </p>
         -->

    </div>
</div>