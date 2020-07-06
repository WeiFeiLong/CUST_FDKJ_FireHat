%----------���¼��㱣����λС��--����roundn(double(Py23), -4) ---------
%----------�����ĸ���վ�Ķ�ά��λ�㷨------------
%----------û����ֵ�ıȽϹ��̣�ͨ��������������ģ�Ȼ����������ĵ����ģ���Ϊ����ֵ-----
%----------��ȡ��õ�txt�����߽��ж�λ-----
clc
close all
[o1,o2]=textread('F:\matlab\2020����ͷ����λ\��X��Y.txt','%s%s','headerlines',0);
o2=guolvshuju(o2)       %�޳���ʽ���Ե�����
da=[];db=[];dc=[];dd=[];
A=[1106.6,808,198.5];  %�ĸ���վ�ͱ�ǩ������,
B=[1074.4,3,198.5];
C=[537,814,198.5];
D=[539.7,3,198.5];
jizhanX=[A(1,1),B(1,1),C(1,1),D(1,1)];
jizhanY=[A(1,2),B(1,2),C(1,2),D(1,2)];
jizhanZ=[A(1,3),B(1,3),C(1,3),D(1,3)];
TAG=[667,500];  %����λ���λ��
global BCD ACD ABD ABC;
global sol12 sol13 sol14 sol23 sol24 sol34
syms  x y ;
L=length(o2)
for i=1:L 
    a=o2(i,1) ;
    AA=Agetdouble(a);  %���ַ�����A�ľ�����ȡ��������ת����double��
    BB=Bgetdouble(a);
    CC=Cgetdouble(a);
    DD=Dgetdouble(a);
    da=[da,AA];     %����վA�ľ�������ȫ���浽����Mi(i=1,2,3,4)�� 
    db=[db,BB]; 
    dc=[dc,CC];
    dd=[dd,DD]; 
end
da, db, dc, dd
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
%------------------------------------------%
AX=A(1,1);AY=A(1,2);
BX=B(1,1);BY=B(1,2);
CX=C(1,1);CY=C(1,2);
DX=D(1,1);DY=D(1,2);
%----------δ֪������ĵ�ʽ��ϵ--------------%
H=100; %����λ��ĸ߶�H����λcm
h=jizhanZ(1,1)-H;
eq1=(x-AX)^2 + (y-AY)^2 -Ajunzhi2^2-h^2;   
eq2=(x-BX)^2 + (y-BY)^2 -Bjunzhi2^2-h^2;  
eq3=(x-CX)^2 + (y-CY)^2 -Cjunzhi2^2-h^2;  
eq4=(x-DX)^2 + (y-DY)^2 -Djunzhi2^2-h^2; 
%-----------��ⷽ����-------------%
sol12=solve(eq1,eq2,x,y);   %ֻ�����������㣬�����������Ӻ���������Σ���ʡʱ��
sol13=solve(eq1,eq3,x,y); 
sol14=solve(eq1,eq4,x,y); 
sol23=solve(eq2,eq3,x,y); 
sol24=solve(eq2,eq4,x,y); 
sol34=solve(eq3,eq4,x,y); 
%----------�ⷽ�̲���ͼ���Լ�д�ĺ�����--------%
subplotBCD(sol24,sol34,sol23,jizhanX,jizhanY);   %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(BCD(1,1),BCD(1,2),'r+'); %����BCD������
hold on
subplotACD(sol13,sol34,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ACD(1,1),ACD(1,2),'y+');  %����ACD������
subplotABD(sol12,sol24,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ABD(1,1),ABD(1,2),'b+');  %����ABD������
subplotABC(sol12,sol13,sol23,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ABC(1,1),ABC(1,2),'g+');  %����ABC������
map_4jizhan();     %����������ͼ
tagABCD=[(BCD(1,1)+ACD(1,1)+ABD(1,1)+ABC(1,1))/4,(BCD(1,2)+ACD(1,2)+ABD(1,2)+ABC(1,2))/4]   %����õ��ĸ�������������
plot(tagABCD(1,1),tagABCD(1,2),'r.','markersize',30)   %����ABCD������
err=sqrt((TAG(1,1)-tagABCD(1,1))^2+(TAG(1,2)-tagABCD(1,2))^2);   %�����ά��λ����λcm

text(tagABCD(1,1)+20,tagABCD(1,2)+20,['(',num2str(round(tagABCD(1,1))),',',num2str(round(tagABCD(1,2))),')'],'fontsize',16,'Color','r'); %����λ�����ע
text(700,900,['��λ��',num2str(round(err)),'cm'],'fontsize',16,'Color','g'); %����λ�����ע



