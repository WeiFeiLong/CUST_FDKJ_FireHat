function y=Cgetdouble(c)
   C=extractAfter(c,'C');
   C=extractBefore(C,'D');
   C=char(C);        %ת����char��
   y=str2num(C);     %����������תΪdouble��
   