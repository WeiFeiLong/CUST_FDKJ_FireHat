function d4d()
[o1,o2]=textread('F:\matlab\�����Ļ�վ�����ݴ���\2.txt','%s%s','headerlines',0); %��ȡĿ¼�µ��ı���a1Ϊ��һ�У�a2Ϊ�ڶ���          
o2 %2.txt�еڶ�������    2(735,520.2)
o2=guolvshuju(o2)       %�޳���ʽ���Ե�����
da=[];db=[];dc=[];dd=[];
Aload=[1106.6,808,198.5];
Bload=[1074.4,3,198.5];
Cload=[537,814,198.5];
Dload=[539.7,3,198.5];
L=length(o2)
for i=1:L 
    a=o2(i,1) ;
    A=Agetdouble(a);  %���ַ�����A�ľ�����ȡ��������ת����double��
    B=Bgetdouble(a);
    C=Cgetdouble(a);
    D=Dgetdouble(a);
    da=[da,A];     %����վA�ľ�������ȫ���浽����Mi(i=1,2,3,4)�� 
    db=[db,B]; 
    dc=[dc,C];
    dd=[dd,D]; 
end
da
db
dc
dd
Ajunzhi = mean(da)  %����ľ�ֵ
Bjunzhi = mean(db)  
Cjunzhi = mean(dc)  
Djunzhi = mean(dd)  

Ajunzhi2=agvfindout(da)    %��ȥ����̫������ݣ�Ȼ�����ֵ��junzhi2
Bjunzhi2=agvfindout(db)
Cjunzhi2=agvfindout(dc)
Djunzhi2=agvfindout(dd)

0.993*Bjunzhi2-17.2,
0.993*Cjunzhi2-17.2,
ABCDabcd(Aload,Bload,Cload,Dload,0.993*Ajunzhi2-17.2,0.993*Bjunzhi2-17.2,0.993*Cjunzhi2-17.2,0.993*Djunzhi2-17.2);   %�󽻵㲢�ڻ�ͼ
%ABCDabcd(Aload,Bload,Cload,Dload,Ajunzhi2,Bjunzhi2,Cjunzhi2,Djunzhi2);   %�󽻵㲢�ڻ�ͼ

% a=0.993*b-17.2
%  syms  x y;  
% eq1=(x-1074)^2 + (y-3)^2 +(198.5-67.3)^2-25;   
% eq2=(x-537)^2 + (y-814)^2 +(198.5-67.3)^2-25;   
% sol1=solve(eq1,eq2,x,y); 
% x,y,