function [new_Dirs]=opt_number(DIRS)
n=length(DIRS);
for i=3:n
    filename=DIRS(i).name;
    if(strfind(filename,'����'))
        new_Dirs{1,1}= filename;
    end
    if(strfind(filename,'����'))
        new_Dirs{1,2}= filename;
    end
     if(strfind(filename,'�ɱ�'))
        new_Dirs{1,3}= filename;
     end
    if(strfind(filename,'ŵľ��'))
        new_Dirs{1,4}= filename;
    end
    if(strfind(filename,'�½�'))
        new_Dirs{1,5}= filename;
    end   
    if(strfind(filename,'�ӱ�'))
        new_Dirs{1,6}= filename;
    end
    if(strfind(filename,'����'))
        new_Dirs{1,7}= filename;
    end
    if(strfind(filename,'�ػ�'))
        new_Dirs{1,8}= filename;
    end
    if(strfind(filename,'����'))
        new_Dirs{1,9}= filename;
    end   
    if(strfind(filename,'ɽ��'))
        new_Dirs{1,10}= filename;
    end  
    if(strfind(filename,'Ң��'))
        new_Dirs{1,11}= filename;
    end  

end
    sumcell={'����','����','�ɱ�','ŵľ��','�½�','�ӱ�','����','�ػ�','����','ɽ��','Ң��'};
    j=0;
    for ii=1:11
        if(isempty(new_Dirs{1,ii})==1)
            j=j+1;
            str=['δ��������' num2str(j) ': ' sumcell{1,ii} ];
            disp(str)
        end
     end
end