function [new_Dirs]=opt_number(DIRS)
n=length(DIRS);
for i=3:n
    filename=DIRS(i).name;
    if(strfind(filename,'内蒙'))
        new_Dirs{1,1}= filename;
    end
    if(strfind(filename,'靖边'))
        new_Dirs{1,2}= filename;
    end
     if(strfind(filename,'干北'))
        new_Dirs{1,3}= filename;
     end
    if(strfind(filename,'诺木洪'))
        new_Dirs{1,4}= filename;
    end
    if(strfind(filename,'新疆'))
        new_Dirs{1,5}= filename;
    end   
    if(strfind(filename,'河北'))
        new_Dirs{1,6}= filename;
    end
    if(strfind(filename,'江苏'))
        new_Dirs{1,7}= filename;
    end
    if(strfind(filename,'敦煌'))
        new_Dirs{1,8}= filename;
    end
    if(strfind(filename,'共和'))
        new_Dirs{1,9}= filename;
    end   
    if(strfind(filename,'山东'))
        new_Dirs{1,10}= filename;
    end  
    if(strfind(filename,'尧生'))
        new_Dirs{1,11}= filename;
    end  

end
    sumcell={'内蒙','靖边','干北','诺木洪','新疆','河北','江苏','敦煌','共和','山东','尧生'};
    j=0;
    for ii=1:11
        if(isempty(new_Dirs{1,ii})==1)
            j=j+1;
            str=['未报送名单' num2str(j) ': ' sumcell{1,ii} ];
            disp(str)
        end
     end
end