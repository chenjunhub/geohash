function expand=geohash_expand(geoh)
% 编码长度    
Len=size(geoh,2);
% Base32编码    
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
% geoh为待解析的编码，是字符串
n=0;
str1='';
str='';
expand=cell(3);

for i=1:Len
    n=find(Base32==geoh(i));
    n=n-1;
    str1=dec2bin(n,5);
    str=[str,str1];
end

code=str;
len=size(code,2);              
code=findup(code,len);            %九宫格，第一个geohash
code=findleft(code,len);
expand(1,1)={bin2geohash(code,len)};

code=str;
code=findup(code,len);
expand(1,2)={bin2geohash(code,len)}; %九宫格，第二个geohash

code=str;
code=findup(code,len);
code=findright(code,len);
expand(1,3)={bin2geohash(code,len)};%九宫格，第三个geohash

code=str;
code=findleft(code,len);
expand(2,1)={bin2geohash(code,len)};%九宫格，第四个geohash

expand(2,2)={geoh};    %九宫格，第五个geohash，也是正中心位置

code=str;
code=findright(code,len);
expand(2,3)={bin2geohash(code,len)};%九宫格，第六个geohash

code=str;
code=finddown(code,len);
code=findleft(code,len);
expand(3,1)={bin2geohash(code,len)};%九宫格，第七个geohash

code=str;
code=finddown(code,len);
expand(3,2)={bin2geohash(code,len)};%九宫格，第八个geohash

code=str;
code=finddown(code,len);
code=findright(code,len);
expand(3,3)={bin2geohash(code,len)};%九宫格，第九个geohash
expand


%%用于将二进制字符串转换成geohash
function geohash=bin2geohash(str,len)
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
geohash='';
str1='';
len=(len/5);
for i=1:len
    str1=Base32(bin2dec(str((i-1)*5+1:i*5))+1);
    geohash=[geohash,str1];
end



