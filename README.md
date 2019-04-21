# This is the Lua library using the UTF8_to_Shift_JIS conversion table for the FlashAir.  

これはFlashAir用のLua ライブラリです。  
Version 0.01  
  
UTF8 to Shift_JIS 変換テーブルファイル "Utf8Sjis.tbl" を予めFlashAirにコピーしておく必要があります。  
UTF-8コードのString文字列をShift_JIS文字列コードに変換できます。  
変換テーブルファイルURL--> https://github.com/mgo-tec/UTF8_to_Shift_JIS  
  
JIS第一水準、第二水準、１３区、半角カナが変換可能です。  
  
【更新履歴】  
(0.01)  
mgo-tecさんの"SD_UTF8toSJIS"を FlashAir に移植しました。  
  
Original   https://github.com/mgo-tec/SD_UTF8toSJIS  
参照ブログ https://www.mgo-tec.com  
  
## Usage  

### Description of the command

command | description
--- | ---
strSJIS, sj_length =<br> UTF8toSJIS:UTF8_to_SJIS_str_cnv(f2, strUTF8)|**f2:** table file handle<br>**strUTF8:** UTF-8 string<br><br>**strSJIS:** Shift-JIS string. If f2 is nil return nil.<br>**sj_length:** Shift-JIS string length


## Licence  

[MIT](https://github.com/AoiSaya/FlashAir_UTF8toSJIS/blob/master/LICENSE)  

## Author  

[GitHub/AoiSaya](https://github.com/AoiSaya)  
[Twitter ID @La_zlo](https://twitter.com/La_zlo)  
