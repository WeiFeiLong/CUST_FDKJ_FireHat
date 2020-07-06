function y=subplotACD(sol13,sol34,sol14,d,e)
%-------a,b,c为三个解方程组，即sol12形式---------%
%-------d,e为四个二维基站x,y坐标数组---------------%
%-----------输出为质心坐标----------------------%
n=4;   %保留n位小数
global ACD

Px2=sol13.x ; 
A=Px2==real(Px2) ;  %取x实数解
Px2=Px2(A); 
Px2=roundn(double(Px2), -n);
Py2=sol13.y;    
B=Py2==real(Py2);
Py2=Py2(B);
Py2=roundn(double(Py2), -n);
ACyellow=[Px2,Py2];
if (ACyellow(1,1)-d(1,4))^2+(ACyellow(1,2)-e(1,4))^2>(ACyellow(2,1)-d(1,4))^2+(ACyellow(2,2)-e(1,4))^2
    AC=[ACyellow(2,1),ACyellow(2,2)];
else 
    AC=[ACyellow(1,1),ACyellow(1,2)];  %过滤得到基于AC邻边的靠近标签的坐标点
end

Px3=sol34.x ; 
A=Px3==real(Px3) ;  %取x实数解
Px3=Px3(A); 
Px3=roundn(double(Px3), -n);
Py3=sol34.y;    
B=Py3==real(Py3);
Py3=Py3(B);
Py3=roundn(double(Py3), -n);
CDblue=[Px3,Py3];
if (CDblue(1,1)-d(1,1))^2+(CDblue(1,2)-e(1,1))^2>(CDblue(2,1)-d(1,1))^2+(CDblue(2,2)-e(1,1))^2
    CD=[CDblue(2,1),CDblue(2,2)];
else 
    CD=[CDblue(1,1),CDblue(1,2)];   %过滤得到基于CD邻边的靠近标签的坐标点
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
AD1=(ADred(1,1)-AC(1,1))^2+(ADred(1,2)-AC(1,2))^2+(ADred(1,1)-CD(1,1))^2+(ADred(1,2)-CD(1,2))^2;
AD2=(ADred(2,1)-AC(1,1))^2+(ADred(2,2)-AC(1,2))^2+(ADred(2,1)-CD(1,1))^2+(ADred(2,2)-CD(1,2))^2;
if AD1>AD2
    AD=[ADred(2,1),ADred(2,2)];
else 
    AD=[ADred(1,1),ADred(1,2)];   %过滤得到基于AD对角边的靠近标签的坐标点
end
ACD=[(AC(1,1)+CD(1,1)+AD(1,1))/3,(AC(1,2)+CD(1,2)+AD(1,2))/3]


