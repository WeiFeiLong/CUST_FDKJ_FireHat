function y=agvfindout(a)
junzhi = mean(a); %��ֵ
youpian_biaozhuncha = std(a,1);  %��׼�� ��ƫ����
xiao=junzhi-2*youpian_biaozhuncha;  %����
da  = junzhi+2*youpian_biaozhuncha;  %����
find(a<xiao|a>da);    %�ҵ�������ڷ�Χ�ڵ�����λ��
a(a<xiao|a>da) =[] ;  %��ȥ���������ڵ�����
y=mean(a);  %���ҡ�2����׼����ֵ


           