


n=0
% ax1=plot(x,y1,'b+');
% ax2=plot(x,y2,'r+');
% ax3=text(0,0,['定位误差：',num2str(23),'cm'],'fontsize',16,'Color','g'); %给定位结果标注 


ax1=plot(-5,-2,'k.');
ax2=ax1
ax3=ax1

xlim([-5,5]);
ylim([-2,2]);
set(gca,'xtick',-5:1:5,'FontSize',16) 
set(gca,'ytick',-2:0.5:2) 

while 1
    n=n+1
         
x =  [1,2,3,4,5,6,7];
y1 = [1,2,-1,0,2,1,0];
y2 = [-2,-1,0,1,2,1,0];
    hold on
   delete(ax1),delete(ax2),delete(ax3);

    pause(1); 
    ax1=plot(x(1,n),y2(1,n),'r+');
    ax2=plot(x(1,n),y1(1,n),'b+');
    ax3=text(0,0,['定位误差：',num2str(23),'cm'],'fontsize',16,'Color','g'); %给定位结果标注 
    pause(1);




end

% delete(ax1)
% delete(ax2)
% delete(ax3)