function r=getoption(opt, name)

      if nargin==1
        %< No argument
        % Return the internal memory
        r = opt;
        %>
    else
        idx = strmatch(name, opt(1:2:end-1),'exact');
        if isempty(idx) 
            %< Unknown argument
            error('options:get:unknown','parameter with name <%s> unknown',name);
            %>
        else
            %< Argument found
            % Its value (and the associate index) is returned
            r = opt{idx(1)*2-1+1};
            %>
        end
    end
