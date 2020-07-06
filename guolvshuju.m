%-----功能：输入n*1的矩阵，根据每行数据的长度，
%-----剔除其中非众数的数据，输出剩下的数据。
%-----输入输出格式不变
%-----长理微波实验室所有-----


function y=guolvshuju(o2)
% function y=guolvshuju()
% [o1,o2]=textread('F:\matlab\基于四基站的数据处理\123.txt','%s%s','headerlines',0); %读取目录下的文本，a1为第一列；a2为第二列
b=[];
L=length(o2)
 for i=1:L
    A=o2(i,1);
    A=char(A);
    ai=length(A);
    b=[b,ai];
 end
 b;   %数据长度的矩阵
k=mode(b);   %数组b的众数
x=find(b~=k);  %找出长度不符合的数据的位置
o2(x)=[];    %将不符合的数据格式从原文本中剔除
y=o2;      %输出剔除后的数据，格式与最初的一样

