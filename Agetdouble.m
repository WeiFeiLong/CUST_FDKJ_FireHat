function y=Agetdouble(a)
   A=extractAfter(a,'A');
   A=extractBefore(A,'B');
   A=char(A);        %ת����char��
   y=str2num(A);    %����������תΪdouble��
   