function y=Dgetdouble(a)
   D=extractAfter(a,'D');
   D=extractBefore(D,'Y');
   D=char(D);        %转换成char型
   y=str2num(D);     %将距离数据转为double型
   