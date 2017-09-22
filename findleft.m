function code=findleft(code,len)
if len<=1
    return;
end
len=len-1;
if code(len) == '0'
    len=len-1;
    code=findleft(code,len);  %不要写成code=findright(code,len-1),浪费了一下午找原因
    code(len+1) = '1';
else
    code(len) = '0';
end