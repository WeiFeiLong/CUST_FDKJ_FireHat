function d4d()
[o1,o2]=textread('F:\matlab\基于四基站的数据处理\2.txt','%s%s','headerlines',0); %读取目录下的文本，a1为第一列；a2为第二列          
o2 %2.txt中第二列数据    2(735,520.2)
o2=guolvshuju(o2)       %剔除格式不对的数据
da=[];db=[];dc=[];dd=[];
Aload=[1106.6,808,198.5];
Bload=[1074.4,3,198.5];
Cload=[537,814,198.5];
Dload=[539.7,3,198.5];
L=length(o2)
for i=1:L 
    a=o2(i,1) ;
    A=Agetdouble(a);  %将字符串中A的距离提取出来，并转换成double型
    B=Bgetdouble(a);
    C=Cgetdouble(a);
    D=Dgetdouble(a);
    da=[da,A];     %到基站A的距离数据全部存到矩阵Mi(i=1,2,3,4)中 
    db=[db,B]; 
    dc=[dc,C];
    dd=[dd,D]; 
end
da
db
dc
dd
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
ABCDabcd(Aload,Bload,Cload,Dload,0.993*Ajunzhi2-17.2,0.993*Bjunzhi2-17.2,0.993*Cjunzhi2-17.2,0.993*Djunzhi2-17.2);   %求交点并在画图
%ABCDabcd(Aload,Bload,Cload,Dload,Ajunzhi2,Bjunzhi2,Cjunzhi2,Djunzhi2);   %求交点并在画图

% a=0.993*b-17.2
%  syms  x y;  
% eq1=(x-1074)^2 + (y-3)^2 +(198.5-67.3)^2-25;   
% eq2=(x-537)^2 + (y-814)^2 +(198.5-67.3)^2-25;   
% sol1=solve(eq1,eq2,x,y); 
% x,y,