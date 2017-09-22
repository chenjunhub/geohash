function code=findup(code,len)
if len<=1
    return;
end
len=len-2;
if code(len+2) == '1'
    code=findup(code,len);
    code(len+2)='0';
else
    code(len+2)='1';
end