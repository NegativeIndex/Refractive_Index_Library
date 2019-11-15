function values = options(default, overwrite)
% OPTIONS - sandbox for optionnal parameters management
%
% use:
% opt = options({'alpha',1,'beta',2},{'alpha',8,'gamma',3})
% opt.get('alpha')
% opt.set('alpha',3)
% opt.get('alpha')
% opt.get()

%%** Optional parameters management

%<* Initialization of the structure
values = default;
if nargin>1
    if ( mod( length(overwrite), 2) >0.5 )
        error('options are not legal');
    end
    for i=1:2:length(overwrite)-1
        idx = strmatch(overwrite{i},values(1:2:end-1),'exact');
        if isempty(idx)
%             %< New parameter
%             % Added to the list of parameters
%             values{end+1} = overwrite{i};
%             values{end+1} = overwrite{i+1};
%             %>
              error('The option is not legal');
        else
            %< Parameter exists
            % the new value replace the old one
            values{idx(1)*2} = overwrite{i+1};
            %>
        end
    end
end

end
