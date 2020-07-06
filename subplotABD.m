function y=subplotABD(sol12,sol24,sol14,d,e)
%-------a,b,c为三个解方程组，即sol12形式---------%
%-------d,e为四个二维基站x,y坐标数组---------------%
%-----------输出为质心坐标----------------------%
n=4;   %保留n位小数

global ABD
 

Px2=sol12.x ; 
A=Px2==real(Px2) ;  %取x实数解
Px2=Px2(A); 
Px2=roundn(double(Px2), -n);
Py2=sol12.y;    
B=Py2==real(Py2);
Py2=Py2(B);
Py2=roundn(double(Py2), -n);
AByellow=[Px2,Py2];
if (AByellow(1,1)-d(1,4))^2+(AByellow(1,2)-e(1,4))^2>(AByellow(2,1)-d(1,4))^2+(AByellow(2,2)-e(1,4))^2
    AB=[AByellow(2,1),AByellow(2,2)];
else 
    AB=[AByellow(1,1),AByellow(1,2)];  %过滤得到基于AB邻边的靠近标签的坐标点
end

Px3=sol24.x ; 
A=Px3==real(Px3) ;  %取x实数解
Px3=Px3(A); 
Px3=roundn(double(Px3), -n);
Py3=sol24.y;    
B=Py3==real(Py3);
Py3=Py3(B);
Py3=roundn(double(Py3), -n);
BDblue=[Px3,Py3];
if (BDblue(1,1)-d(1,1))^2+(BDblue(1,2)-e(1,1))^2>(BDblue(2,1)-d(1,1))^2+(BDblue(2,2)-e(1,1))^2
    BD=[BDblue(2,1),BDblue(2,2)];
else 
    BD=[BDblue(1,1),BDblue(1,2)];   %过滤得到基于BD邻边的靠近标签的坐标点
end

Px1=sol14.x ; 
A=Px1==real(Px1) ;  %取x实数解
Px1=Px1(A); 
Px1=roundn(double(Px1), -n);
Py1=sol14.y;    
B=Py1==real(Py1);
Py1=Py1(B);
Py1=roundn(double(Py1), -n) ;
ADred=[Px1,Py1];
AD1=(ADred(1,1)-AB(1,1))^2+(ADred(1,2)-AB(1,2))^2+(ADred(1,1)-BD(1,1))^2+(ADred(1,2)-BD(1,2))^2;
AD2=(ADred(2,1)-AB(1,1))^2+(ADred(2,2)-AB(1,2))^2+(ADred(2,1)-BD(1,1))^2+(ADred(2,2)-BD(1,2))^2;
if AD1>AD2
    AD=[ADred(2,1),ADred(2,2)];
else 
    AD=[ADred(1,1),ADred(1,2)];   %过滤得到基于AD对角边的靠近标签的坐标点
end
ABD=[(AB(1,1)+BD(1,1)+AD(1,1))/3,(AB(1,2)+BD(1,2)+AD(1,2))/3]


