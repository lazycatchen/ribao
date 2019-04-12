clc;
clear;
close all;

mydir=uigetdir('F:\0','ѡ��һ��Ŀ¼');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
new_Dirs=cell(1,11);
DIRS=dir([mydir]);  %��չ��
new_Dirs=opt_number(DIRS);    %�������ĸ���վû���ձ�
n=length(new_Dirs);
datay=ones(0,10);
datax=cell(1,12);
datay_GF=ones(0,13);
input_date = input('�������½���˾�����Ŀ����:');%%�½���˾����һ�������ļ�������Ҫ������ȡ
disp(['����',num2str(input_date),'��']); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i=[1:7]%��Ϊ�����߸������Ŀ
   %*************���ļ�****************
    filename=new_Dirs{1,i};
    str=[mydir filename];
   if(isempty(new_Dirs{1,i})==0)         %�ж��¶�ȡ�ѱ��͵ı�δ���͵ĳ�վ��0
       [Type Sheet Format]=xlsfinfo(str); %��ȡsheetֵ������������ض����ڵ�sheet
       if  i==4                   %���ⳡվ����
           sheet_Num=input_date;  %�ຣ�ı���ǰд��һ������
       elseif i==2
           sheet_Num=input_date;   %�����ı�Ҳ��ǰд��һ������
       elseif i==5
           sheet_Num=length(Sheet)-1; %�½��ı�������һ���ļ�
       else
           sheet_Num=length(Sheet);   %������վ��������
       end
       temp=xlsread(str,Sheet{sheet_Num});  %������
       ud_Data=temp(:,1:10);                %ǰʮ����������
      ud_Data(any(isnan(ud_Data)'),:)=[];   %ɾ��ȫNAN��
      datax{1,i}=ud_Data;                %�����ݵ�cell
      datay=[datay;ud_Data];             %�����ݵ�����
      disp([filename '��ȡ���' ]);
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for iii=[1,8:11]   %��ȡ�����վ���ݣ��������ɵı�����ϲ���
   %*************���ļ�****************
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
      disp([filename '��ȡ���' ]);
   end
end
[wind_Result,solar_Result]=merge_cell(datax);
sum_rb=[wind_Result(:,[1,4]);solar_Result(:,[1,7])];  %�ϲ���硢�������
result_rb=hit_rb(sum_rb);                            %���û��ܺ���
strresult_rb=['F:\0\' mydir(end-4:end-1) '.xls'];    %��������������
xlswrite(strresult_rb, wind_Result, 1);               %д�����ݣ�1����磬2���⻢��3���ձ���4������
xlswrite(strresult_rb, solar_Result, 2);
xlswrite(strresult_rb, sum_rb, 3);
xlswrite(strresult_rb, result_rb, 4);