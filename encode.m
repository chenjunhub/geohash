function geohash=encode(lat,lot,prec) %编码
% Base32编码    
Base32= '0123456789bcdefghjkmnpqrstuvwxyz';
latitude=[-90,90];%纬度
longitude=[-180,180];%经度
length=prec*5;%需要的二进制编码长度
k=1;
bits=zeros(1,5);%记录二进制码
l=1;
for i=1:length
    if mod(i,2)~=0  
        mid=mean(longitude);
        if lot>mid
            bits(l)=1;
            l=l+1;
            longitude(1)=mid;
        else
            bits(l)=0;
            l=l+1;
            longitude(2)=mid;
        end
    else
        mid=mean(latitude);  %从1开始奇数位为纬度
        if lat>mid
            bits(l)=1;
            l=l+1;
            latitude(1)=mid;
        else
            bits(l)=0;
            l=l+1;
            latitude(2)=mid;
        end
    end
    if ~mod(i,5)
        geohash(k)=Base32(1*bits(5)+2*bits(4)+4*bits(3)+8*bits(2)+16*bits(1)+1);
        bits=zeros(1,5);
        l=1;
        k=k+1;
    end
end

        
        
        

  
    


