function y=subplotBCD(sol24,sol34,sol23,d,e)
%-------a,b,cΪ�����ⷽ���飬��sol12��ʽ---------%
%-------d,eΪ�ĸ���ά��վx,y��������---------------%
%-----------�������BCD��վ����������----------------------%
n=4;   %����nλС��
global BCD

Px2=sol24.x ; 
A=Px2==real(Px2) ;  %ȡxʵ����
Px2=Px2(A); 
Px2=roundn(double(Px2), -n);
Py2=sol24.y;    
B=Py2==real(Py2);
Py2=Py2(B);
Py2=roundn(double(Py2), -n);
BDyellow=[Px2,Py2];
if (BDyellow(1,1)-d(1,3))^2+(BDyellow(1,2)-e(1,3))^2>(BDyellow(2,1)-d(1,3))^2+(BDyellow(2,2)-e(1,3))^2
    BD=[BDyellow(2,1),BDyellow(2,2)];
else 
    BD=[BDyellow(1,1),BDyellow(1,2)];  %���˵õ�����BD�ڱߵĿ�����ǩ�������
end

Px3=sol34.x ; 
A=Px3==real(Px3) ;  %ȡxʵ����
Px3=Px3(A); 
Px3=roundn(double(Px3), -n);
Py3=sol34.y;    
B=Py3==real(Py3);
Py3=Py3(B);
Py3=roundn(double(Py3), -n);
CDblue=[Px3,Py3];
if (CDblue(1,1)-d(1,2))^2+(CDblue(1,2)-e(1,2))^2>(CDblue(2,1)-d(1,2))^2+(CDblue(2,2)-e(1,2))^2
    CD=[CDblue(2,1),CDblue(2,2)];
else 
    CD=[CDblue(1,1),CDblue(1,2)];   %���˵õ�����CD�ڱߵĿ�����ǩ�������
end

Px1=sol23.x ; 
A=Px1==real(Px1) ;  %ȡxʵ����
Px1=Px1(A); 
Px1=roundn(double(Px1), -n);
Py1=sol23.y;    
B=Py1==real(Py1);
Py1=Py1(B);
Py1=roundn(double(Py1), -n) ;
BCred=[Px1,Py1];
BC1=(BCred(1,1)-BD(1,1))^2+(BCred(1,2)-BD(1,2))^2+(BCred(1,1)-CD(1,1))^2+(BCred(1,2)-CD(1,2))^2;
BC2=(BCred(2,1)-BD(1,1))^2+(BCred(2,2)-BD(1,2))^2+(BCred(2,1)-CD(1,1))^2+(BCred(2,2)-CD(1,2))^2;
if BC1>BC2
    BC=[BCred(2,1),BCred(2,2)];
else 
    BC=[BCred(1,1),BCred(1,2)];   %���˵õ�����BC�ԽǱߵĿ�����ǩ�������
end
BCD=[(BD(1,1)+BC(1,1)+CD(1,1))/3,(BD(1,2)+BC(1,2)+CD(1,2))/3]


