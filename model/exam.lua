local db = require "db.database"

local exam = {
    table_name = "ts_exam"
}

function exam:select_all()
    local sql = "select * from " .. self.table_name .. ";"
    local result, ok = db.exec(db.select, sql)
    if #result > 0 or next(result) then
        return result, ok
    end
    return cjson.empty_array, ok
end

return exam
