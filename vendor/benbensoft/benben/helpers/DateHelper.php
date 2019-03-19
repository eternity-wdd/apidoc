<?php
namespace benben\helpers;

class DateHelper
{
    /**
     * 获取今天的开始时间
     */
    public static function getTodayStartTime()
    {
        return strtotime(date('Y-m-d', time()));
    }
    /**
     * 获取今天的结束时间
     */
    public static function getTodayEndTime()
    {
        return strtotime(date('Y-m-d', time()))+86400;
    }
    /**
     * 获取昨天的开始时间
     */
    public static function getYesterdayStartTime()
    {
        return strtotime(date('Y-m-d', strtotime("-1 day")));
    }
    /**
     * 获取最近七天的开始时间
     */
    public static function getDayStartTime($days)
    {
        $days = $days-1;
        return strtotime(date('Y-m-d', strtotime("-$days day")));
    }
    /**
     * 获取最近4周的开始时间
     */
    public static function getWeekStartTime($weeks)
    {
        if ($weeks==0){
           return  strtotime(date('Y-m-d',(time()-((date('w')==0?7:date('w'))-1)*24*3600)));
        }else {
           return  strtotime(date('Y-m-d',strtotime('-'.$weeks.' week last monday', time()))); 
        }
     
    }
     /**
     * 获取本月的开始时间
     */
    public static function getMonthStartTime()
    {
        return $monthStart = strtotime(date("Y-m-01",strtotime(date('Y-m',time()))));
    }
    /**
     * 获取上个月的开始时间
     */
    public static function getPreMonthStartTime()
    {
        return strtotime(date('Y-m-01', strtotime("-1 month")));
    }
   
}