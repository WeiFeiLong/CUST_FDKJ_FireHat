function y=map_4jizhan()
%画出五基站的定位地图
%作于2019.4.22
%版本v1.0
T=[0,15,510,555,1080,1123,1600;0,255,310,850,900,0,0];   %大致坐标轴
Aload=[1100,850,198.5];  %4基站的坐标
Bload=[1100,3,198.5];
Cload=[532,850,198.5];
Dload=[532,3,198.5];
%---------------------------------------画地图-----------------------------------------------------------
plot(T(1,1),T(2,1),'k',T(1,1),T(2,5),'k',T(1,7),T(2,1),'k',T(1,7),T(2,5),'k')   %画1600*900地图外围
set(gca,'linewidth',0.5,'fontsize',25);
xlabel('环境地图x轴方向/cm');% x轴名称
ylabel('环境地图y轴方向/cm');% y轴名称
hold on
%-------------------------------------画立柱框架-------------------------------------------
plot([0,15],[255,255],[15,15],[255,310],[0,15],[310,310])   %图1，1
plot([0,15],[850,850],[15,15],[850,900])   %图1，2
plot([510,555],[255,255],[555,555],[255,310],[510,555],[310,310],[510,510],[255,310])   %图2，1
plot([510,510],[850,900],[510,555],[850,850],[555,555],[850,900])   %图2，2
plot([1080,1080],[255,310],[1080,1123],[255,255],[1123,1123],[255,310],[1080,1123],[310,310])   %图3，1
plot([1080,1080],[850,900],[1080,1123],[850,850],[1123,1123],[850,900])   %图 3，2
%—————————给立柱加粗----------------------------
plot([7.5,7.5],[255,310],'y','linewidth',7.5)  %1,1,
plot([7.5,7.5],[850,900],'y','linewidth',7.5)   %1,2
plot([532.5,532.5],[255,310],'y','linewidth',22.5)   %2,1
plot([532.5,532.5],[850,900],'y','linewidth',22.5)   %2,2
plot([1101.5,1101.5],[255,310],'y','linewidth',21.5)   %3,1
plot([1101.5,1101.5],[850,900],'y','linewidth',21.5)   %3,2
 %--------------------画出4个基站的位置------------------------------------------
plot(Aload(1,1),Aload(1,2),'bp','markerfacecolor','b','markersize',15); 
plot(Bload(1,1),Bload(1,2),'bP','markerfacecolor','b','markersize',15)
plot(Cload(1,1),Cload(1,2),'bP','markerfacecolor','b','markersize',15)
plot(Dload(1,1),Dload(1,2),'bP','markerfacecolor','b','markersize',15)
%—————————————附加部分—————————————————————------------------------------
grid on    %图中增加大网格
grid minor   %图中增加小网格
end