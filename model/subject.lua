local db = require "db.database"

local subject = {
    table_name = "ts_exam_subject"
}

function subject:select_all()
    local sql = "select * from " .. self.table_name .. ";"
    local result, ok = db.exec(db.select, sql)
    return result, ok
end

return subject
