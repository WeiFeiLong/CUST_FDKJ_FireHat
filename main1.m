%----------以下计算保留四位小数--例如roundn(double(Py23), -4) ---------
%----------基于四个基站的二维定位算法------------
%----------没有阈值的比较过程，通过先求四组的质心，然后再最后质心的质心，即为最后的值-----
%----------读取存好的txt，离线进行定位-----
clc
close all
[o1,o2]=textread('F:\matlab\2020智能头盔定位\首X终Y.txt','%s%s','headerlines',0);
o2=guolvshuju(o2)       %剔除格式不对的数据
da=[];db=[];dc=[];dd=[];
A=[1106.6,808,198.5];  %四个基站和标签的坐标,
B=[1074.4,3,198.5];
C=[537,814,198.5];
D=[539.7,3,198.5];
jizhanX=[A(1,1),B(1,1),C(1,1),D(1,1)];
jizhanY=[A(1,2),B(1,2),C(1,2),D(1,2)];
jizhanZ=[A(1,3),B(1,3),C(1,3),D(1,3)];
TAG=[667,500];  %待定位点的位置
global BCD ACD ABD ABC;
global sol12 sol13 sol14 sol23 sol24 sol34
syms  x y ;
L=length(o2)
for i=1:L 
    a=o2(i,1) ;
    AA=Agetdouble(a);  %将字符串中A的距离提取出来，并转换成double型
    BB=Bgetdouble(a);
    CC=Cgetdouble(a);
    DD=Dgetdouble(a);
    da=[da,AA];     %到基站A的距离数据全部存到矩阵Mi(i=1,2,3,4)中 
    db=[db,BB]; 
    dc=[dc,CC];
    dd=[dd,DD]; 
end
da, db, dc, dd
Ajunzhi = mean(da)  %最初的均值
Bjunzhi = mean(db)  
Cjunzhi = mean(dc)  
Djunzhi = mean(dd)  
Ajunzhi2=agvfindout(da)    %减去波动太大的数据，然后求均值，junzhi2
Bjunzhi2=agvfindout(db)
Cjunzhi2=agvfindout(dc)
Djunzhi2=agvfindout(dd)

0.993*Bjunzhi2-17.2,
0.993*Cjunzhi2-17.2,
%------------------------------------------%
AX=A(1,1);AY=A(1,2);
BX=B(1,1);BY=B(1,2);
CX=C(1,1);CY=C(1,2);
DX=D(1,1);DY=D(1,2);
%----------未知量满足的等式关系--------------%
H=100; %带定位点的高度H，单位cm
h=jizhanZ(1,1)-H;
eq1=(x-AX)^2 + (y-AY)^2 -Ajunzhi2^2-h^2;   
eq2=(x-BX)^2 + (y-BY)^2 -Bjunzhi2^2-h^2;  
eq3=(x-CX)^2 + (y-CY)^2 -Cjunzhi2^2-h^2;  
eq4=(x-DX)^2 + (y-DY)^2 -Djunzhi2^2-h^2; 
%-----------求解方程组-------------%
sol12=solve(eq1,eq2,x,y);   %只在主函数计算，避免在所有子函数里计算多次，节省时间
sol13=solve(eq1,eq3,x,y); 
sol14=solve(eq1,eq4,x,y); 
sol23=solve(eq2,eq3,x,y); 
sol24=solve(eq2,eq4,x,y); 
sol34=solve(eq3,eq4,x,y); 
%----------解方程并画图（自己写的函数）--------%
subplotBCD(sol24,sol34,sol23,jizhanX,jizhanY);   %输入顺序按从小到大，从邻边到对角边填入
plot(BCD(1,1),BCD(1,2),'r+'); %画出BCD的质心
hold on
subplotACD(sol13,sol34,sol14,jizhanX,jizhanY);    %输入顺序按从小到大，从邻边到对角边填入
plot(ACD(1,1),ACD(1,2),'y+');  %画出ACD的质心
subplotABD(sol12,sol24,sol14,jizhanX,jizhanY);    %输入顺序按从小到大，从邻边到对角边填入
plot(ABD(1,1),ABD(1,2),'b+');  %画出ABD的质心
subplotABC(sol12,sol13,sol23,jizhanX,jizhanY);    %输入顺序按从小到大，从邻边到对角边填入
plot(ABC(1,1),ABC(1,2),'g+');  %画出ABC的质心
map_4jizhan();     %画出环境地图
tagABCD=[(BCD(1,1)+ACD(1,1)+ABD(1,1)+ABC(1,1))/4,(BCD(1,2)+ACD(1,2)+ABD(1,2)+ABC(1,2))/4]   %将求得的四个质心再求质心
plot(tagABCD(1,1),tagABCD(1,2),'r.','markersize',30)   %画出ABCD的质心
err=sqrt((TAG(1,1)-tagABCD(1,1))^2+(TAG(1,2)-tagABCD(1,2))^2);   %求出二维定位误差，单位cm

text(tagABCD(1,1)+20,tagABCD(1,2)+20,['(',num2str(round(tagABCD(1,1))),',',num2str(round(tagABCD(1,2))),')'],'fontsize',16,'Color','r'); %给定位结果标注
text(700,900,['定位误差：',num2str(round(err)),'cm'],'fontsize',16,'Color','g'); %给定位结果标注



