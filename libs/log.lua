local log = {}

-- local server_name = ""

function log:init(name)
    print("start " .. name .. " init log model...")
    self.server_name = name
end

function log:debug(...)
    ngx.log(ngx.DEBUG, self.server_name, ":", ...)
end

function log:info(...)
    ngx.log(ngx.INFO, self.server_name, ":", ...)
end

function log:warn(...)
    ngx.log(ngx.WARN, self.server_name, ":", ...)
end

function log:error(...)
    ngx.log(ngx.ERR, self.server_name, ":", ...)
end

return log
