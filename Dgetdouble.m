function y=Dgetdouble(a)
   D=extractAfter(a,'D');
   D=extractBefore(D,'Y');
   D=char(D);        %ת����char��
   y=str2num(D);     %����������תΪdouble��
   