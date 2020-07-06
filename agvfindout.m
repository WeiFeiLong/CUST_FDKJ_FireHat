function y=agvfindout(a)
junzhi = mean(a); %均值
youpian_biaozhuncha = std(a,1);  %标准差 有偏估计
xiao=junzhi-2*youpian_biaozhuncha;  %下限
da  = junzhi+2*youpian_biaozhuncha;  %上限
find(a<xiao|a>da);    %找到最初不在范围内的数据位置
a(a<xiao|a>da) =[] ;  %减去不在区间内的数据
y=mean(a);  %左右±2倍标准差后均值


           