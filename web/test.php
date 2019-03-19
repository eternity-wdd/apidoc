<?php
# --- ENCRYPTION ---
        
        # the key should be random binary, use scrypt, bcrypt or PBKDF2 to
        # convert a string into a key
        # key is specified using hexadecimal
        $key = [0x12, 0x18, 0x76, 0x41, 0x81, 0xAE, 0xCF, 0xAA, 0x12, 0x18, 0x76, 0x41, 0x81, 0xAE, 0xCF, 0xAA];
//         $key = [0x12, 0x18, 0x76, 0x41, 0x81, 0xAE, 0xCF, 0xAA];
        $keyStr = '';
        foreach ($key as $item)
        {
                $keyStr.=chr($item);
        }
        
        # show key size use either 16, 24 or 32 byte keys for AES-128, 192
        # and 256 respectively
        $key_size =  strlen($keyStr);
        echo "Key size: " . $key_size . "\n";
        
        $plaintext = 'www.baidu.com';
        
        # create a random IV to use with CBC encoding
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
        
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
//         $iv = '12345678';
//         echo $iv;exit();
        # creates a cipher text compatible with AES (Rijndael block size = 128)
        # to keep the text confidential
        # only suitable for encoded input that never ends with value 00h
        # (because of default zero padding)
        echo $keyStr.'<br />';
        $ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $keyStr,
        '145e3349-f0ef-4026-928b-ec3f6a60518', MCRYPT_MODE_CBC, $iv);
        
        echo base64_encode($ciphertext).'<br />';
        # prepend the IV for it to be available for decryption
        $ciphertext = $iv . $ciphertext;
        
        # encode the resulting cipher text so it can be represented by a string
        $ciphertext_base64 = base64_encode($ciphertext);
        
        echo  $ciphertext_base64 . "\n";
        
        $ciphertext_dec = base64_decode($ciphertext_base64);
        
        # retrieves the IV, iv_size should be created using mcrypt_get_iv_size()
        $iv_dec = substr($ciphertext_dec, 0, $iv_size);
        
        # retrieves the cipher text (everything except the $iv_size in the front)
        $ciphertext_dec = substr($ciphertext_dec, $iv_size);
        
        # may remove 00h valued characters from end of plain text
        $plaintext_dec = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $keyStr,
        $ciphertext_dec, MCRYPT_MODE_CBC, $iv_dec);
        
        echo  '<br />plaintext:'.$plaintext_dec . "\n";



exit();
