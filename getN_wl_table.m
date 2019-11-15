function [nn,ss]=getN_wl_table(fname, m)
% fname contains the refractive index data
% the refractive indices are calculated based on interpolation.

um=1e-6;
aa=load(fname);
% the file has three columns: wavelength in um, real(n), imag(n)
wl=aa(:,1);
wlmin=min(wl);
wlmax=max(wl);
ss=RangeErrorCheck(m/um,wlmin,wlmax);

%% new code
[n1,n2]=size(aa);
if n2==3
	n=aa(:,2)+1i*aa(:,3);
elseif n2==2
	n=aa(:,2);
else
	error('Material raw data matrix is not right');
end

%% end of new code
nn=interp1(wl, n, m/um,'spline');
