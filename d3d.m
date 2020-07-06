%----------���¼��㱣����λС��--����roundn(double(Py23), -4) ---------
%----------�����ĸ���վ�Ķ�ά��λ�㷨------------
%----------û����ֵ�ıȽϹ��̣�ͨ��������������ģ�Ȼ����������ĵ����ģ���Ϊ����ֵ-----
A=[1000,1000];  %�ĸ���վ�ͱ�ǩ������,
B=[1000,0];
C=[0,1000];
D=[0,0];
jizhanX=[A(1,1),B(1,1),C(1,1),D(1,1)];
jizhanY=[A(1,2),B(1,2),C(1,2),D(1,2)];
TAG=[500,500]
tagx=TAG(1,1);tagy=TAG(1,2);
a=710;b=709;c=715;d=709;   %��׼ֵ708
%------------------------------------------%
global BCD ACD ABD ABC;
global sol12 sol13 sol14 sol23 sol24 sol34
syms  x y ;
AX=A(1,1);AY=A(1,2);
BX=B(1,1);BY=B(1,2);
CX=C(1,1);CY=C(1,2);
DX=D(1,1);DY=D(1,2);
%----------δ֪������ĵ�ʽ��ϵ--------------%
eq1=(x-AX)^2 + (y-AY)^2 -a^2;   
eq2=(x-BX)^2 + (y-BY)^2 -b^2;  
eq3=(x-CX)^2 + (y-CY)^2 -c^2;  
eq4=(x-DX)^2 + (y-DY)^2 -d^2; 
%-----------��ⷽ����-------------%
sol12=solve(eq1,eq2,x,y);   %ֻ�����������㣬�����������Ӻ���������Σ���ʡʱ��
sol13=solve(eq1,eq3,x,y); 
sol14=solve(eq1,eq4,x,y); 
sol23=solve(eq2,eq3,x,y); 
sol24=solve(eq2,eq4,x,y); 
sol34=solve(eq3,eq4,x,y); 
%----------�ⷽ�̲���ͼ���Լ�д�ĺ�����--------%
subplotBCD(sol24,sol34,sol23,jizhanX,jizhanY);   %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(BCD(1,1),BCD(1,2),'r+');
hold on

subplotACD(sol13,sol34,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ACD(1,1),ACD(1,2),'y+');
hold on

subplotABD(sol12,sol24,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ABD(1,1),ABD(1,2),'b+');
hold on

subplotABC(sol12,sol13,sol23,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
plot(ABC(1,1),ABC(1,2),'g+');

tagABCD=[(BCD(1,1)+ACD(1,1)+ABD(1,1)+ABC(1,1))/4,(BCD(1,2)+ACD(1,2)+ABD(1,2)+ABC(1,2))/4]   %����õ��ĸ�������������
plot(tagABCD(1,1),tagABCD(1,2),'r.')   %��������ͼ




