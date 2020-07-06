function y=Cgetdouble(c)
   C=extractAfter(c,'C');
   C=extractBefore(C,'D');
   C=char(C);        %转换成char型
   y=str2num(C);     %将距离数据转为double型
   