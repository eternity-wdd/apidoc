<?php
use yii\helpers\Url;
?>
<style type="text/css">

</style>
<div class="api-modules">
<?php foreach ($modules as $module):?>
<a class="btn btn-primary" href="<?=Url::toRoute(['list', 'module_id'=>$module->name])?>"><?= $module->label;?></a>
<?php endforeach;?>
</div>

