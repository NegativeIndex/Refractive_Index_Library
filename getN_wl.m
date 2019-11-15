function nn=getN_wl(str,wl,varargin)
% It is the general entrance to get refractive index
% first parameter is a string of material
% sedond parameter is wavelengths in meter
% supporting material:
% 'cSi-Schinke','InAs-Adachi','ITO-Moerland','SiO2-thinfilm-Lemarchand','Al2O3-Boidin'
% add one option: RangeCheck

default={'RangeCheck', 'on'};
opt = options(default, varargin);
out=getoption(opt, 'RangeCheck');
bRC=strcmp(out,'on');

dname=which('getN_wl');
[dname,~,~]=fileparts(dname);
disp(dname);


%% get available files
aa=ls(fullfile(dname,'WebData','*txt'));
[n,m]=size(aa);
matnames=cell(1,n);
for ii=1:n
   fname=aa(ii,:);
   matnames{1,ii}=regexprep(fname,'\.txt\s+','');
end

%%
switch str
    % old fashion refractive index based on table
    case matnames
        fname=fullfile(dname,'WebData',[str,'.txt']);
        [nn,ss]=getN_wl_table(fname,wl);
        if bRC && ~isempty(ss)
            ME = MException('MyComponent:noSuchVariable',ss);
			throw(ME)
        end
    otherwise
		disp('Available material list: ');
		for i=1:length(matnames)
            disp(['     ',matnames{i}]);
        end
		error('Material is not defined');
end
end
