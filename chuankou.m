%�� �ƣ�Matlab����-Lab1
%�� �������ڶ�����д��txt�ļ���
s=serial('COM4','BaudRate',9600,'Parity','none','DataBits',8,'StopBits',1)

s.InputBufferSize=4096;
s.OutputBufferSize=4096;
fopen(s);                  %�򿪴���,��ʱ̫��5
out=fread(s,100,'uint8');   %һ�ζ���10���ַ� ����ʱ̫��2.5 
ww=fprintf('%c',out);        %һ���ַ�ռ��λ���,%c�ַ���%d����
 
fid=fopen('serial_data.txt','w+'); % 'a+'��д��ʽ�򿪣����ļ�ָ��ָ���ļ�ĩβ������ļ����������Դ���֮
fprintf(fid,'%3c',out);            % д���ļ���        
fclose(fid);
 
fclose(s);
delete(s);

