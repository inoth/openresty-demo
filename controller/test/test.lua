local function string_joint(str, split_chr)
    local long_str = ""
    for i = 1, #str do
        if type(str[i]) == "string" then
            long_str = long_str .. str[i] .. split_chr
        elseif type(str[i]) == "number" then
            long_str = long_str .. str[i] .. split_chr
        end
    end
    return string.sub(long_str, 1, -1 - #split_chr)
end

local function create_examinees_batch(adds)
    local now = ngx.time()
    local db_table = "ts_examinees"
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
    sql = sql .. string_joint(values, ",") .. ";"
    log:info("create_examinees_batch sql --> " .. sql)
    return sql
end

local test_data = {}

for i = 1, 10 do
    local data = {
        exam_id = "exam_" .. i,
        examinees_id = "examinees_" .. i,
        name = "Name " .. i,
        student_id = "student_" .. i,
        status = 1,
        class_id = "class_" .. i,
        school_id = i,
        grade = "grade_" .. i
    }
    table.insert(test_data, data)
end


res.return_json(nil, nil, test_data)
-- local db = require "db/mysql_connect"
-- db:init(cfg.db_config)

-- local result, ok = db:exec("select * from t_user_info;")
-- if not ok then
--     res.return_json(nil, nil, "出现错误")
-- end

-- local exam = require "model.exam"

-- local result, ok = exam:select_all()
-- if not ok then
--     res.return_json(nil, nil, "出现错误")
-- end
-- res.return_json(nil, nil, result)
