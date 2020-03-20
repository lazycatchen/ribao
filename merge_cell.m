function [wind_Result,solar_Result]=merge_cell(datax)
    temp=[4,2,3,3,3,4,1,1,4,2,1,2];
    for ii=1:12
        if(isempty(datax{1,ii})==1)
            datax{1,ii}=ones(temp(1,ii),20)*0;
        end
     end
%     result(1:3,:)=datax{1,1};%20200107 修改内蒙，增加“东新风电场”
    wind_Result=[datax{1,1}(1:4,1:10); datax{1,2}(1:2,1:10); datax{1,3}(1:3,1:10); datax{1,4}(1:3,1:10); datax{1,5}(1:3,1:10);...
        datax{1,6}(1:4,1:10);datax{1,7}(1:1,1:10)];
    solar_Result=[datax{1,8}(1:1,1:13); datax{1,9}(1:4,1:13); datax{1,10}(1:2,1:13); datax{1,11}(1:1,1:13); datax{1,12}(1:2,1:13)];%%
end