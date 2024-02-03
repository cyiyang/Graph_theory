function [num] = str_to_num(str)
%此函数将英文字母转化为数字ACII
    num = double('str') - 64;
end