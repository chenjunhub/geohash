function code=findright(code,len)
if len<=1
    return;
end
len=len-1;
if code(len) == '1'
    len=len-1;
    code=findright(code,len);  %不要写成code=findright(code,len-1),浪费了一下午找原因
    code(len+1) = '0';
else
    code(len) = '1';
end

