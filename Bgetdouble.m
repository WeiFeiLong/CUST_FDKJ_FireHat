function y=Bgetdouble(b)
   B=extractAfter(b,'B');
   B=extractBefore(B,'C');
   B=char(B);        %ת����char��
   y=str2num(B);   %����������תΪdouble��