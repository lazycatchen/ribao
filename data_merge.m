clc;clear;
mydir=uigetdir('F:\0','ѡ��һ��Ŀ¼');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
new_Dirs=cell(1,11);
DIRS=dir([mydir]);  %��չ��
n=length(DIRS);
num=n-2;
 for i=3:n  
   %*************���ļ�**************** 
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
xlswrite('E:\aa0011\ribao\�ϲ�����.xlsx', winddata);
xlswrite('E:\aa0011\ribao\�ϲ�����.xlsx', solardata, 2);
