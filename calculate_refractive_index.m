clc
clearvars
close all

% calclate Si
nm=1e-9;
wls=[800:10:1000]*nm;
nns=getN_wl('cSi-Schinke',wls)

% range check, if 'off', it will calculate anyway; if 'on', it will give
% the error message
wls=[100:100:800]*nm;
nns=getN_wl('cSi-Schinke',wls, 'RangeCheck','off')
nns=getN_wl('cSi-Schinke',wls, 'RangeCheck','on')

% wrong material stirng, show the supported string, then error message
nns=getN_wl('cSi',wls)

