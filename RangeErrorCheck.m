function ss=RangeErrorCheck(m,wlmin,wlmax)
% all the input has the unit of um
ss='';
idx=find( (m<wlmin) | (m>wlmax) );
if ~isempty(idx)
    ss1=sprintf('[%g', m(idx(1)));
    for ii=2:length(idx)
        if (ii>3)
            ss1=[ss1,' ...'];
            break;
        end
        ss1=[ss1,sprintf(',%g',m(idx(ii)))];
    end
    ss1=[ss1,'] um is out of range'];
    ss2=sprintf('The wavelength range is %g um to %g um', ...
        wlmin, wlmax);
    ss=[ss1,char(10),ss2];
end