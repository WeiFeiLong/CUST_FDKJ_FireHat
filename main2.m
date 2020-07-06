%----------���¼��㱣����λС��--����roundn(double(Py23), -4) ---------
%----------�����ĸ���վ��ABCD���Ķ�ά��λ�㷨------------
%----------û����ֵ�ıȽϹ��̣�ͨ��������������ģ�Ȼ����������ĵ����ģ���Ϊ����ֵ-----
%----------ͨ�����ڶ�ȡ���ݣ�ʵʱ��ʾ,ˢ��ʱ����10s-----
%%
clc
close all
instrfindall
delete(instrfindall) %�������ڴ�
instrfindall
%%
s=serial('COM4','BaudRate',9600,'Parity','none','DataBits',8,'StopBits',1)% ��������
s.InputBufferSize=4096;
s.OutputBufferSize=4096;
fopen(s);                  %�򿪴���,��ʱ̫��5
%%
map_4jizhan();     %����������ͼ
as5=plot(0,0,'k.','markersize',1);   %ǰ��
hold on
as6=as5;
as7=as5;
as8=as5;
num=1;  %��ʼѭ���Ĵ���Ϊ0
Ajunzhi(1,num)=400,
Bjunzhi(1,num)=400,
Cjunzhi(1,num)=400,
Djunzhi(1,num)=400,

%%
while 1
%%
    
    %��ʼ������
    global BCD ACD ABD ABC;
    global sol12 sol13 sol14 sol23 sol24 sol34
    syms  x y ;
    TAG=[667,500];  %����λ���λ��
    H=100; %����λ��ĸ߶�H����λcm
    h=jizhanZ(1,1)-H;
    da=[];db=[];dc=[];dd=[];
    A=[1106.6,808,198.5];  %�ĸ���վ�ͱ�ǩ������,
    B=[1074.4,3,198.5];
    C=[537,814,198.5];
    D=[539.7,3,198.5];
    jizhanX=[A(1,1),B(1,1),C(1,1),D(1,1)];
    jizhanY=[A(1,2),B(1,2),C(1,2),D(1,2)];
    jizhanZ=[A(1,3),B(1,3),C(1,3),D(1,3)];
    num=num+1,  %��¼ѭ���Ĵ���
%%
    %���������ݣ���txt������ȡ����
    out=fread(s,600,'uint8');   %һ�ζ���500���ַ� ����ʱ̫��2.5 
    fprintf('%c',out);        % %c�ַ���%d����
    fid=fopen('s.txt','w+'); % 'a+'��д��ʽ�򿪣����ļ�ָ��ָ���ļ�ĩβ������ļ����������Դ���֮
    fprintf(fid,'%c',out);            % д���ļ���        
    fclose(fid);
    [o1,o2]=textread('F:\matlab\2020����ͷ����λ\s.txt','%s%s','headerlines',0)
    o1=guolvshuju(o1)       %�޳���ʽ���Ե�����
    L=length(o1)
    for i=1:L 
        a=o1(i,1) ;
        AA=Agetdouble(a);  %���ַ�����A�ľ�����ȡ��������ת����double��
        BB=Bgetdouble(a);
        CC=Cgetdouble(a);
        DD=Dgetdouble(a);
        da=[da,AA];     %����վA�ľ�������ȫ���浽����Mi(i=1,2,3,4)�� 
        db=[db,BB]; 
        dc=[dc,CC];
        dd=[dd,DD]; 
    end
    da, db, dc, dd
%%
%����Ԥ��������������
%     Ajunzhi = mean(da),            %����ľ�ֵ
%     Bjunzhi = mean(db),
%     Cjunzhi = mean(dc), 
%     Djunzhi = mean(dd),  
    Ajunzhi=agvfindout(da),          %��ȥ����̫������ݣ�Ȼ�����ֵ��junzhi2
    Bjunzhi=agvfindout(db),
    Cjunzhi=agvfindout(dc),
    Djunzhi=agvfindout(dd),
%     Ajunzhi=0.993*Ajunzhi-17.2,  %�������У���������
%     Bjunzhi=0.993*Bjunzhi-17.2,
%     Cjunzhi=0.993*Cjunzhi-17.2,
%     Djunzhi=0.993*Djunzhi-17.2,
    %------------------------------------------%
    AX=A(1,1);AY=A(1,2);
    BX=B(1,1);BY=B(1,2);
    CX=C(1,1);CY=C(1,2);
    DX=D(1,1);DY=D(1,2);
    %----------δ֪������ĵ�ʽ��ϵ--------------%
    eq1=(x-AX)^2 + (y-AY)^2 -Ajunzhi^2-h^2;   
    eq2=(x-BX)^2 + (y-BY)^2 -Bjunzhi^2-h^2;  
    eq3=(x-CX)^2 + (y-CY)^2 -Cjunzhi^2-h^2;  
    eq4=(x-DX)^2 + (y-DY)^2 -Djunzhi^2-h^2; 
    %-----------��ⷽ����-------------%
    sol12=solve(eq1,eq2,x,y);   %ֻ�����������㣬�����������Ӻ���������Σ���ʡʱ��
    sol13=solve(eq1,eq3,x,y); 
    sol14=solve(eq1,eq4,x,y); 
    sol23=solve(eq2,eq3,x,y); 
    sol24=solve(eq2,eq4,x,y); 
    sol34=solve(eq3,eq4,x,y); 
    %----------�ⷽ�̲���ͼ���Լ�д�ĺ�����--------%
%%
%��λ�㷨��������ͼ��ʾ
    subplotBCD(sol24,sol34,sol23,jizhanX,jizhanY);   %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
%     as1=plot(BCD(1,1),BCD(1,2),'r+'); %����BCD������
    hold on
    subplotACD(sol13,sol34,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
%     as2=plot(ACD(1,1),ACD(1,2),'y+');  %����ACD������
    subplotABD(sol12,sol24,sol14,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
%     as3=plot(ABD(1,1),ABD(1,2),'b+');  %����ABD������
    subplotABC(sol12,sol13,sol23,jizhanX,jizhanY);    %����˳�򰴴�С���󣬴��ڱߵ��ԽǱ�����
%     as4=plot(ABC(1,1),ABC(1,2),'g+');  %����ABC������
    
    tagABCD=[(BCD(1,1)+ACD(1,1)+ABD(1,1)+ABC(1,1))/4,(BCD(1,2)+ACD(1,2)+ABD(1,2)+ABC(1,2))/4]   %����õ��ĸ�������������
     %----------�ٴλ�ͼʱ��Ҫɾ���ϴεĶ�λ��as5,��λ���עas6,���ı�עas7--------%
    delete(as5),delete(as6),delete(as7),delete(as8);   %ɾ���ϴεĶ�λ�㣬�����µĶ�λ��
    pause(1);   %��Ҫ����ʱ����Ȼ��̬���ɼ�
    as5=plot(tagABCD(1,1),tagABCD(1,2),'r.','markersize',30);   %����ABCD������
    as6=text(tagABCD(1,1)+20,tagABCD(1,2)+20,['(',num2str(round(tagABCD(1,1))),',',num2str(round(tagABCD(1,2))),')'],'fontsize',16,'Color','r'); %����λ�����ע
    err=sqrt((TAG(1,1)-tagABCD(1,1))^2+(TAG(1,2)-tagABCD(1,2))^2);   %�����ά��λ����λcm
    as7=text(700,900,['��λ��',num2str(round(err)),'cm'],'fontsize',16,'Color','g'); %����λ�����ע 
    as8=plot(TAG(1,1),TAG(1,2),'g.','markersize',30);   %��������λ��
    pause(1);   %��Ҫ����ʱ����Ȼ��̬���ɼ�
end
    




