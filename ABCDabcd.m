function y=ABCDabcd(A,B,C,D,a,b,c,d)
%---ABCD为基站三维坐标----------abcd为四个距离----%
AX=A(1,1);AY=A(1,2);AZ=A(1,3);
BX=B(1,1);BY=B(1,2);BZ=B(1,3);
CX=C(1,1);CY=C(1,2);CZ=C(1,3);
DX=D(1,1);DY=D(1,2);DZ=D(1,3);


jizhanX=[AX,BX,CX,DX];  %基站的横坐标
jizhanY=[AY,BY,CY,DY];   %基站的纵坐标
tagx=735;tagy=520.2;
tagm=720.3;tagn=521.5;
syms  x y ;  
h=67.3;   %标签到地面的高度cm
%----------未知量满足的等式关系--------------%
H=AZ-h ;  %标签到基站的高度

eq1=(x-AX)^2 + (y-AY)^2 + H^2-a^2;   
eq2=(x-BX)^2 + (y-BY)^2 + H^2-b^2;  
eq3=(x-CX)^2 + (y-CY)^2 + H^2-c^2;  
eq4=(x-DX)^2 + (y-DY)^2 + H^2-d^2; 
%-----------求解方程组-------------%
sol2=solve(eq1,eq2,x,y);  
so24=solve(eq2,eq4,x,y); 
so34=solve(eq3,eq4,x,y); 
so13=solve(eq1,eq3,x,y);  
%-----------解xyAB-------------%
x1=sol2.x ; 
A=x1==real(x1) ;  %取x实数解
x1=x1(A); 
x1=round(x1);

y1=sol2.y;    
B=y1==real(y1);
y1=y1(B);
y1=round(y1);
AA=[x1,y1] 
%------------解xyBD------------%
x2=so24.x;   
A=x2==real(x2);   %取x实数解
x2=x2(A);
x2=round(x2);

y2=so24.y;    
B=y2==real(y2);
y2=y2(B);
y2=round(y2);
BB=[x2,y2]
%------------解xyCD------------%
x3=so34.x;   
A=x3==real(x3);   %取x实数解
x3=x3(A);
x3=round(x3);

y3=so34.y;    
B=y3==real(y3);
y3=y3(B);
y3=round(y3);
CC=[x3,y3]
%-----------解xyAC-------------%
x4=so13.x ; 
A=x4==real(x4) ;  %取x实数解
x4=x4(A); 
x4=round(x4);

y4=so13.y;    
B=y4==real(y4);
y4=y4(B);
y4=round(y4);
DD=[x4,y4] 


plot(jizhanX,jizhanY,'kp',x1,y1,'r+',x2,y2,'y+',x3,y3,'b+',x4,y4,'g+',tagx,tagy,'cx',tagm,tagn,'cp')%绘制计算点的位置坐标








