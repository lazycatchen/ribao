clc;
clear;
close all;
str='F:\0\py_ribao\月报\比武\新投运场站技术指标\2018年12月31日生产数据统计.xlsx'
[Type Sheet Format]=xlsfinfo(str);
data=xlsread(str,Sheet{36});

nuo1(1,1:12)=[sum(data(1:31,1));sum(data(32:59,1));sum(data(60:90,1));sum(data(91:120,1));sum(data(121:151,1));sum(data(152:181,1))...
    ;sum(data(182:212,1));sum(data(213:243,1));sum(data(244:273,1));sum(data(274:304,1));sum(data(305:334,1));sum(data(335:365,1))];
%nuo1(2,1:12)=[vpa(mean(data(1:31,4)),2);vpa(mean(data(32:59,4)),2);vpa(mean(data(60:90,4)),2);vpa(mean(data(91:120,4)),2);vpa(mean(data(121:151,4)),2);vpa(mean(data(152:181,4)),2)...
    %;vpa(mean(data(182:212,4)),2);vpa(mean(data(213:243,4)),2);vpa(mean(data(244:273,4)),2);vpa(mean(data(274:304,4)),2);vpa(mean(data(305:334,4)),2);vpa(mean(data(335:365,4)),2)];
nuo1(2,1:12)=[vpa(mean(data(1:31,6)),2);vpa(mean(data(32:59,6)),2);vpa(mean(data(60:90,6)),2);vpa(mean(data(91:120,6)),2);vpa(mean(data(121:151,6)),2);vpa(mean(data(152:181,6)),2)...
    ;vpa(mean(data(182:212,6)),2);vpa(mean(data(213:243,6)),2);vpa(mean(data(244:273,6)),2);vpa(mean(data(274:304,6)),2);vpa(mean(data(305:334,6)),2);vpa(mean(data(335:365,6)),2)];

    table=1:12;

for ii=1:12
   strtest{1,ii}= num2str(round(nuo1(1,ii)));
   
   strtest{2,ii}= num2str(roundn(nuo1(2,ii),-2));
end

nuo1(1,:)=mapminmax(nuo1(1,:),0,1);
nuo1(2,:)=mapminmax(nuo1(2,:),0,0.6);
figure
plot(table,nuo1(1,:),'r*-','Linewidth',1);     
text(table+0.02,nuo1(1,:)+0.01,char(strtest{1,:}),'Color','black','FontSize',9) 
hold on;
plot(table,nuo1(2,:),'b.-','Linewidth',1);
text(table+0.01,nuo1(2,:)+0.02,char(strtest{2,:}),'Color','black','FontSize',9) 
xlabel('月份','FontSize',12,'FontWeight','bold');
ylabel('莒县光伏电站','FontSize',12,'FontWeight','bold');
ylim([-0.1, 1.1]);
xlim([-0.1, 12.3]);
set(gca,'ytick',[])
set(gca,'XTick',[1:112]);
legend('发电量(万kWh)','辐照量(MJ/m^2)');
%legend('发电量(万kWh)','风速(m/s)');
%title('诺木洪一期','FontSize',12);
%data=xlsread(str,Sheet{13});