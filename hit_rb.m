function result_rb=hit_rb(sum_rb,input_date)
    str='E:\aa0011\ribao\日报综合数据.xlsx'
    [Type Sheet Format]=xlsfinfo(str)
    data=xlsread(str,Sheet{1});
    day_Wind=sum(sum_rb(1:19,1));
    day_Solar=sum(sum_rb(20:29,1));
    day_sum=day_Wind+day_Solar;
    month_Wind=day_Wind+data(1,1);
    year_Wind=day_Wind/10000+data(1,2);
    month_Solar=day_Solar+data(2,1);
    year_Solar=day_Solar/10000+data(2,2);
    year_sum=year_Wind+year_Solar;
    date=data(6,2)+1;
    day_ave=year_sum/date*10000;
    result_rb=[month_Wind year_Wind;month_Solar year_Solar;year_sum day_ave;day_sum day_Wind; day_Solar 7;input_date date];
end