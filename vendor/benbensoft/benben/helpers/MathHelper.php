<?php
namespace benben\helpers;


class MathHelper
{
    public static function sub(...$params)
    {
        $ret = $params[0];
        $i = 1;
        
        if(isset($params[$i]))
        {
            do{
                $tmp = $ret;
                $ret = self::bc_math('bcsub', $tmp, $params[$i]);
                $i++;
            }while(array_key_exists($i, $params));
        }
        
        return self::trim($ret);
    }
    
    public static function add(...$params)
    {
        $ret = $params[0];
        $i = 1;
        if(isset($params[$i]))
        {
            do{
                $tmp = $ret;
                $ret = self::bc_math('bcadd', $tmp, $params[$i]);
                $i++;
            }while(array_key_exists($i, $params));
        }
        return self::trim($ret);
    }
    
    /**
     * 去除多余的0
     */
    public static function trim($value)
    {
        $ret = self::comp(ceil($value), $value);
    
        if($ret == 0) // 没有小数部分
        {
            return intval($value);
        }
        else // 有小数
        {
            return rtrim(number_format($value, 2, '.', ''),'0');
        }
    }
    
    /**
     * 比较两个数的大小
     */
    public static function comp($v1, $v2)
    {
        return bccomp($v1, $v2);
    }
    
    /**
     * 格式化金额格式
     */
    public static function money($value)
    {
        $ret = self::comp(ceil($value), $value);
    
        if($ret == 0) // 没有小数部分
        {
            return intval($value);
        }
        else // 有小数
        {
            return rtrim(number_format($value, 2, '.', ''),'0');
        }
    }
    /**
     * 格式化手机号
     */
    public static function format_phone($phone)
    {
        preg_match('/([\d]{3})([\d]{4})([\d]{4})/', $phone,$match);
        unset($match[0]);
        $phone = implode(' ', $match);
        return $phone;
    }
    /**
     * 将或后的整数反转换成组合的元素数组, 最大支持16位
     */
    public static function bitOrToArr($value)
    {
        $items = [];
        for($i = 0; $i < 16; $i++)
        {
            $signal = 1 << $i;
            if($signal & $value)
                $items[] = $signal;
        }
        return $items;
    }
    
    /**
     * 将给定数据中的整数或操作返回或操作后的结果
     * @return int
     */
    public static function arrToBit($arr)
    {
        $ret = 0;
        foreach ($arr as $v)
        {
            $ret |= $v;
        }
        return $ret;
    }
    
    private static function bc_math($method,$left_operand,$right_operand,$scale=3){
        if(function_exists($method))
        {
            return $method(strval($left_operand),strval($right_operand),$scale);
        }
        else
        {
           /*  if($method == 'bcsub')
            {
                return Yii::app()->db->createCommand('SELECT ('.$left_operand.')-'.($right_operand).' AS nums')->queryScalar();
            }
            elseif ($method == 'bcadd')
            {
                return Yii::app()->db->createCommand('SELECT ('.$left_operand.')+'.($right_operand).' AS nums')->queryScalar();
            } */
        }
    }
}

