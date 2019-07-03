clc;clear;
mydir=uigetdir('F:\0','选择一个目录');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
new_Dirs=cell(1,11);
DIRS=dir([mydir]);  %扩展名
n=length(DIRS);
num=n-2;
 for i=3:n  
   %*************打开文件**************** 
    filename=DIRS(i).name;
    str=[mydir filename];
    [Type Sheet Format]=xlsfinfo(str); 
    temp=xlsread(str,Sheet{1});
    temp2=xlsread(str,Sheet{2});
    table1=ones(19,1)*(i-2);
    table2=ones(10,1)*(i-2);
    for ii=1:19
        winddata(ii*num+i-num,:)  =[ii temp(ii,:)];
    end
    for iii=1:10
        solardata(iii*num+i-num,:)  =[iii temp2(iii,:)];
     end
 end
xlswrite('E:\aa0011\ribao\合并数据.xlsx', winddata);
xlswrite('E:\aa0011\ribao\合并数据.xlsx', solardata, 2);
