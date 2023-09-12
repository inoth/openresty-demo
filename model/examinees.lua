local db = require "db.database"

local examinees = {
    table_name = "ts_examinees"
}

function examinees:select_all()
    local sql = "select * from " .. self.table_name .. ";"
    local result, ok = db.exec(db.select, sql)
    return result, ok
end

function examinees:create_examinees_batch(adds)
    local db_table = self.table_name
    local sql = "INSERT INTO "
        .. db_table
        .. "(exam_id,examinees_id,`name`,student_id,`status`,class_id,school_id,grade) VALUES "
    local values = {}
    for _, item in ipairs(adds) do
        table.insert(values, string.format("(%s,%s,%s,%s,%s,%s,%s,%s)",
            ngx.quote_sql_str(item["exam_id"]),
            ngx.quote_sql_str(item["examinees_id"]),
            ngx.quote_sql_str(item["name"]),
            ngx.quote_sql_str(item["student_id"]),
            ngx.quote_sql_str(item["status"]),
            ngx.quote_sql_str(item["class_id"]),
            ngx.quote_sql_str(item["school_id"]),
            ngx.quote_sql_str(item["grade"])
        ))
    end
    
    log:info("values is: ", cjson_safe.encode(values))

    sql = sql .. util.string_join(values, ",") .. ";"
    log:info("create_examinees_batch sql --> ", sql)

    return db.exec(db.create, sql)
end

return examinees
