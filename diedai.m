function y=diedai(d,n)
%-------a,b,cΪ�����ⷽ���飬��sol12��ʽ---------%
%-------d,eΪ�ĸ���ά��վx,y��������---------------%
%-----------�������BCD��վ����������----------------------%
if  d(n)==0
    d(n)=d(n-1);
    fprintf('��վ%c���������,�����ڵ�%d��\n', d,n)
else
    d(n)=d(n);
end

y=d(n);






