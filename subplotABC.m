function y=subplotABC(sol12,sol13,sol23,d,e)
%-------a,b,cΪ�����ⷽ���飬��sol12��ʽ---------%
%-------d,eΪ�ĸ���ά��վx,y��������---------------%
%-----------���Ϊ��������----------------------%
n=4;   %����nλС��
global ABC

Px2=sol12.x ; 
A=Px2==real(Px2) ;  %ȡxʵ����
Px2=Px2(A); 
Px2=roundn(double(Px2), -n);
Py2=sol12.y;    
B=Py2==real(Py2);
Py2=Py2(B);
Py2=roundn(double(Py2), -n);
AByellow=[Px2,Py2];
if (AByellow(1,1)-d(1,3))^2+(AByellow(1,2)-e(1,3))^2>(AByellow(2,1)-d(1,3))^2+(AByellow(2,2)-e(1,3))^2
    AB=[AByellow(2,1),AByellow(2,2)];
else 
    AB=[AByellow(1,1),AByellow(1,2)];  %���˵õ�����AB�ڱߵĿ�����ǩ�������
end

Px3=sol13.x ; 
A=Px3==real(Px3) ;  %ȡxʵ����
Px3=Px3(A); 
Px3=roundn(double(Px3), -n);
Py3=sol13.y;    
B=Py3==real(Py3);
Py3=Py3(B);
Py3=roundn(double(Py3), -n);
ACblue=[Px3,Py3];
if (ACblue(1,1)-d(1,2))^2+(ACblue(1,2)-e(1,2))^2>(ACblue(2,1)-d(1,2))^2+(ACblue(2,2)-e(1,2))^2
    AC=[ACblue(2,1),ACblue(2,2)];
else 
    AC=[ACblue(1,1),ACblue(1,2)];   %���˵õ�����AC�ڱߵĿ�����ǩ�������
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
BC1=(BCred(1,1)-AB(1,1))^2+(BCred(1,2)-AB(1,2))^2+(BCred(1,1)-AC(1,1))^2+(BCred(1,2)-AC(1,2))^2;
BC2=(BCred(2,1)-AB(1,1))^2+(BCred(2,2)-AB(1,2))^2+(BCred(2,1)-AC(1,1))^2+(BCred(2,2)-AC(1,2))^2;
if BC1>BC2
    BC=[BCred(2,1),BCred(2,2)];
else 
    BC=[BCred(1,1),BCred(1,2)];   %���˵õ�����BC�ԽǱߵĿ�����ǩ�������
end
ABC=[(AB(1,1)+AC(1,1)+BC(1,1))/3,(AB(1,2)+AC(1,2)+BC(1,2))/3]


