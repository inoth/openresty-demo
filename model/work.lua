local db = require "db.database"

local work = {
    table_name = "ts_worker"
}

function work:select_all()
    local sql = "select * from " .. self.table_name .. ";"
    local result, ok = db.exec(db.select, sql)
    return result, ok
end

return work
