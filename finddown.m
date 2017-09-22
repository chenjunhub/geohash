function code=finddown(code,len)
if len<=1
    return;
end
if code(len)=='0'
    len=len-2;
    code=finddown(code,len);
    code(len+2)='1';
else
    code(len)='0';
end
