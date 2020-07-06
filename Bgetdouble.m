function y=Bgetdouble(b)
   B=extractAfter(b,'B');
   B=extractBefore(B,'C');
   B=char(B);        %转换成char型
   y=str2num(B);   %将距离数据转为double型