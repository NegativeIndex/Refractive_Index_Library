clc
clear all
close all
addpath('H:\functions\Matlab_20160802')

olddname='WebRawData';
newdname='Webdata';

fnames=FileList(olddname,'.*txt');
for i=1:length(fnames)
    fname=fnames{i};
    disp(fname);
    process_data(fullfile(olddname,fname),fullfile(newdname,fname))
end

function process_data(fname,dfname)

fid = fopen(fname);
tline = fgetl(fid);

data=[];
while ischar(tline)
    if regexp(tline, 'wl\s+n')
        mode='n';
        % disp('n mode');
    elseif regexp(tline, 'wl\s+k')
        mode='k';
        % disp('k mode');
    else
        tokens=str2num(tline);
        if length(tokens)==2
            wl=tokens(1);
            ref=tokens(2);
            % fprintf(1,'%f;  %f\n',wl,ref);
            if mode=='n'
                aa=[wl,ref,0];
                data=[data;aa];
            elseif mode=='k'
                [~,idx]=min(abs(data(:,1)-wl));
                data(idx,3)=ref;
            end
        end
    end
    tline = fgetl(fid);    
end
fclose(fid);


savematrix4(dfname,data,'%16.10f %0.8e %0.8e',{'wavelength, n, k'});

end