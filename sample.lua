-----------------------------------------------
-- Sample of UTF8toSJIS.lua for W4.00.03
-- Copyright (c) 2019, Saya
-- All rights reserved.
-- 2019/04/21 rev.0.01
-----------------------------------------------
function chkBreak(n)
	sleep(n or 0)
		if fa.sharedmemory("read", 0x00, 0x01, "") == "!" then
		error("Break!",2)
	end
end
fa.sharedmemory("write", 0x00, 0x01, "-")

function script_path()
	local  str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

-- main
local myDir  = script_path()
local libDir = myDir.."lib/"
local UTF8toSJIS = require(libDir .. "UTF8toSJIS")
local UTF8SJIS_table = "Utf8Sjis.tbl"
local SJIS_file = "sample_out.txt"
local strUTF8, strSJIS, sj_length
local str={
  "ＵＴＦ８→Ｓ－ＪＩＳ　全角日本語漢字変換テスト表",
  "、。〃¢‐　一倅怎瀁耀退！￥熙～",
  "※〒℃⇒⇔♪Ωαβγθπφ●○◎◆◇■□★☆", --よく使われる記号
  "①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩ", --JIS １３区文字
  "㍉㌔㌢㍍㌘㌧㌃㌶㍑㍗㌍㌦㌣㌫㍊㌻㎜㎝㎞㎎㎏㏄㎡〝〟№㏍℡", --JIS １３区文字
  "㊤㊥㊦㊧㊨㈱㈲㈹㍾㍽㍼㍻∮∑∟⊿∪∩∠⊥≡≒√∵∫", --JIS １３区文字
  "半角/ABC 全角/ＡＢＣ　半角カナ/ｱｶｻﾀﾅﾜｦﾝ ｶﾞﾊﾟ ｧｨｩｪｫｬｭｮ"
}

local fhw = io.open(myDir..SJIS_file, "w")
local fht = io.open(myDir..UTF8SJIS_table, "r")

for i=1,#str do
	strUTF8 = str[i]
	strSJIS, sj_length = UTF8toSJIS:UTF8_to_SJIS_str_cnv(fht, strUTF8)
    fhw:write(strSJIS, "\n")
	chkBreak()
end

fhw:close()
fht:close()

return
