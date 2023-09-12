local mysql = require "resty.mysql"

local _M = {}
local mt = { __index = _M }

function _M:new()
    local db, err = mysql:new()
    if not db then
        log:error("failed to instantiate mysql: ", err)
        return nil
    end
    local ok, err, errno, sqlstate = db:connect(cfg.db_config)
    if not ok then
        log:error("failed to connect: ", err, ": ", errno, ": ", sqlstate)
        return nil
    end
    return setmetatable({ db = db }, mt)
end

function _M:exec(sql)
    local db = self.db
    local res, err, errno, sqlstate = db:query(sql)
    if not res then
        log:error("sql execute failed: ", err, ": ", errno, ": ", sqlstate)
        return nil, false
    end
    return res, true
end

function _M:select(sql)
    return self:exec(sql)
end

function _M:insert(sql)
    local res, ok = self:exec(sql)
    if not ok then
        return false
    elseif res and res.affected_rows <= 0 then
        return false
    end
    return true
end

function _M:update(sql)
    local res, ok = self:exec(sql)
    if not ok then
        return false
    elseif res and res.affected_rows <= 0 then
        return false
    end
    return true
end

function _M:delete(sql)
    local res, ok = self:exec(sql)
    if not ok then
        return false
    elseif res and res.affected_rows <= 0 then
        return false
    end
    return true
end

return _M
