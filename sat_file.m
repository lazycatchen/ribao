clc;
clear;
close all;

mydir=uigetdir('F:\0','选择一个目录');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
new_Dirs=cell(1,11);
DIRS=dir([mydir]);  %扩展名
new_Dirs=opt_number(DIRS);    %看看是哪个场站没报日报
n=length(new_Dirs);
datay=ones(0,10);
datax=cell(1,12);
datay_GF=ones(0,13);
input_date = input('请输入新疆公司光伏项目日期:');%%新疆公司存在一个隐藏文件，故需要单独读取
disp(['计算',num2str(input_date),'日']); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i=[1:7]%此为遍历七个风电项目
   %*************打开文件****************
    filename=new_Dirs{1,i};
    str=[mydir filename];
   if(isempty(new_Dirs{1,i})==0)         %判断下读取已报送的表，未报送的场站置0
       [Type Sheet Format]=xlsfinfo(str); %读取sheet值，方便后续读特定日期的sheet
       if  i==4                   %特殊场站处理
           sheet_Num=input_date;  %青海的表提前写了一堆日期
       elseif i==2
           sheet_Num=input_date;   %陕西的表也提前写了一堆日期
       elseif i==5
           sheet_Num=length(Sheet)-1; %新疆的表隐藏了一个文件
       else
           sheet_Num=length(Sheet);   %其他场站就正常了
       end
       temp=xlsread(str,Sheet{sheet_Num});  %读数据
       ud_Data=temp(:,1:10);                %前十个数据有用
      ud_Data(any(isnan(ud_Data)'),:)=[];   %删除全NAN行
      datax{1,i}=ud_Data;                %存数据到cell
      datay=[datay;ud_Data];             %存数据到矩阵
      disp([filename '读取完毕' ]);
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for iii=[1,8:11]   %读取光伏电站数据，其中内蒙的表与风电合并了
   %*************打开文件****************
    filename=new_Dirs{1,iii};
    str=[mydir filename];
%     temp=importdata(str);
%     count=length(fieldnames(temp.data));
%     ud_DataS=struct2cell(temp.data);

   if(isempty(new_Dirs{1,iii})==0)
       [Type Sheet Format]=xlsfinfo(str);
      switch  iii
          case 1
               save_count=12;
               sheet_Num=length(Sheet);
          case 9
                sheet_Num=input_date;
                save_count=iii;
          otherwise
           sheet_Num=length(Sheet);
           save_count=iii;
      end
       temp=xlsread(str,Sheet{sheet_Num});
       ud_Data=temp(:,1:13);
      ud_Data(any(isnan(ud_Data)'),:)=[];
      datax{1,save_count}=ud_Data; 
      datay_GF=[datay_GF;ud_Data];
      disp([filename '读取完毕' ]);
   end
end
[wind_Result,solar_Result]=merge_cell(datax);
sum_rb=[wind_Result(:,[1,4]);solar_Result(:,[1,7])];  %合并风电、光伏数据
result_rb=hit_rb(sum_rb);                            %调用汇总函数
strresult_rb=['F:\0\' mydir(end-4:end-1) '.xls'];    %以日期命名保存
xlswrite(strresult_rb, wind_Result, 1);               %写入数据，1：风电，2：光虎，3：日报，4，汇总
xlswrite(strresult_rb, solar_Result, 2);
xlswrite(strresult_rb, sum_rb, 3);
xlswrite(strresult_rb, result_rb, 4);