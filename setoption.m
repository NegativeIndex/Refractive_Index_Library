function opt = setoption(opt, name, value)
    idx = strmatch(name, opt(1:2:end-1),'exact');
    if isempty(idx) 
            %< Unknown argument
            error('options:set:unknown','parameter with name <%s> unknown',name);
            %>
    else
        opt{idx(1)*2-1+1} = value;
    end
end
