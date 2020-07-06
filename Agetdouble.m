function y=Agetdouble(a)
   A=extractAfter(a,'A');
   A=extractBefore(A,'B');
   A=char(A);        %转换成char型
   y=str2num(A);    %将距离数据转为double型
   