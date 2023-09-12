local db = require "db.db"

local database = {}

database.select = "select"
database.update = "update"
database.create = "create"
database.delete = "delete"

---comment
---@param action any
---@param sql any
function database.exec(action, sql)
    local db_scope = db:new()
    if action == database.select then
        return db_scope:select(sql)
    elseif action == database.update then
        return db_scope:update(sql)
    elseif action == database.create then
        return db_scope:insert(sql)
    elseif action == database.delete then
        return db_scope:delete(sql)
    else
        log:error("unknown database operation request: ", action)
        return nil, false
    end
end

return database
