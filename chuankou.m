%名 称：Matlab串口-Lab1
%描 述：串口读，并写入txt文件中
s=serial('COM4','BaudRate',9600,'Parity','none','DataBits',8,'StopBits',1)

s.InputBufferSize=4096;
s.OutputBufferSize=4096;
fopen(s);                  %打开串口,耗时太高5
out=fread(s,100,'uint8');   %一次读出10个字符 ，耗时太高2.5 
ww=fprintf('%c',out);        %一个字符占三位输出,%c字符，%d整型
 
fid=fopen('serial_data.txt','w+'); % 'a+'读写方式打开，将文件指针指向文件末尾。如果文件不存在则尝试创建之
fprintf(fid,'%3c',out);            % 写入文件中        
fclose(fid);
 
fclose(s);
delete(s);

