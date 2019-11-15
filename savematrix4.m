
function succ=savematrix4(filename, x, cformat, comm)
% An updated version. Now we can add comment to the file
% now we can control the format
% varibles are (filename, x, cformat, comm)
% get better comment output
% addpath('D:\Research\functions\Matlab_strings')

hfile=fopen(filename,'w');

if nargin==2
    cformat='';
    comm='';
elseif nargin==3
    comm='';
end

%% comment line begin with %%
for i=1:length(comm)
    line=regexprep(comm{i},'^\s+',''); % delete leading white space
    line=regexprep(line,'^%%+','%%');
    if (line(1)~='%') || (line(2)~='%')
        line=['%% ',line];
    end
    fprintf(hfile, '%s\n',line);
end

dformat='%+13.11e   '; % default format
cformats=strsplit(strtrim(cformat));
if isempty(cformats{1})
    cformats=[];
end


[n,m]=size(x);
% fprintf(1,'data size is %d x %d\n',n,m);
for ii=1:n
    ss='';
    for jj=1:m
        if (jj<=length(cformats))
			% fprintf(1,'jj=%d, %s\n',jj,cformats{jj});
            ss=[ss,sprintf([cformats{jj},'  '], x(ii,jj))];
        else
		    % fprintf(1,'jj=%d, %s\n',jj,dformat);
            ss=[ss,sprintf(dformat, x(ii,jj))];
        end
		% disp(ss);
    end
    fprintf(hfile, [ss,'\n']);
end
fclose(hfile);
succ=1;

