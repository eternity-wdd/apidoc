<?php
namespace benben\helpers;


class ImageHelper
{
    public static function zoomOut($srcImage, $dstFile, $targetWidth)
    {
        $sourceInfo = getimagesize($srcImage);
        
        if($sourceInfo[0] > $targetWidth)
        {
            $targetHeight = $sourceInfo[1] * $targetWidth / $sourceInfo[0];
        }
        else
        {
            $targetWidth = $sourceInfo[0];
            $targetHeight = $sourceInfo[1];
        }
        
            switch ($sourceInfo['mime'])
            {
                case 'image/gif':
                    $source_image = imagecreatefromgif($srcImage);
                    break;
                case 'image/jpeg':
                    $source_image = imagecreatefromjpeg($srcImage);
                    break;
                case 'image/png':
                    $source_image = imagecreatefrompng($srcImage);
                    break;
            }
            
            $targetImage  = imagecreatetruecolor($targetWidth, $targetHeight);
            imagecopyresampled($targetImage, $source_image, 0, 0, 0, 0, $targetWidth, $targetHeight, $sourceInfo[0], $sourceInfo[1]);
            
//             $targetFile = substr(0, strrpos($file, '.')) . '_' . $targetWidth . substr(strrpos($file, '.') + 1);
//             $limitResult[$targetWidth] = substr($targetFile, strrpos($targetFile, '/'));
            
            switch ($sourceInfo['mime'])
            {
                case 'image/gif':
                    imagegif($targetImage, $dstFile);
                    break;
                case 'image/jpeg':
                    imagejpeg($targetImage, $dstFile);
                    break;
                case 'image/png':
                    imagepng($targetImage, $dstFile);
                    break;
            }
        
        return true;
    }
}