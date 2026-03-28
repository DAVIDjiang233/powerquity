function scr_stringtreal(str) {
    // 去除字符串前后的空格
	
    var clean_str = string_trim(str);
    
    // 检查字符串是否为空
    if (clean_str == "") {
        return 0;
    }
    
    // 检查字符串格式是否合法
    var length = string_length(clean_str);
    var has_decimal = false;
    var has_digits = false;
    var start_index = 0;
    
    // 检查是否有正负号
    if (string_char_at(clean_str, 1) == "-" || string_char_at(clean_str, 1) == "+") {
        start_index = 1;
        // 如果字符串只有符号没有数字，返回错误
        if (length == 1) {
            return 0;
        }
    }
    
    // 遍历检查每个字符
    for (var i = start_index + 1; i <= length; i++) {
        var char = string_char_at(clean_str, i);
        
        // 检查是否为数字
        if (string_digits(string_pos(char, "0123456789"))) {
            has_digits = true;
        }
        // 检查是否为小数点
        else if (char == ".") {
            if (has_decimal) {
                // 如果已经有小数点了，再次出现则无效
                return 0;
            }
            has_decimal = true;
            // 确保小数点前后至少有一个数字
            if ((i == length) && !has_digits) {
                return 0;
            }
        }
        else {
            // 遇到非法字符
            return 0;
        }
    }
    
    // 如果没有数字，返回错误
    if (!has_digits) {
        return 0;
    }
    
    // 如果可以转换为实数，返回转换后的值
    return 1;
}