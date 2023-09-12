local examinees = require "model.examinees"

local args = ngx.req.get_uri_args()
local data = util.get_body()

local token = args.token
local sign = args.sign
local exam_id = args.exam_id
local req_examinees_id = args.examinees_id


if #data <= 0 then
    err.params_err()
end

log:info(cjson.encode(data))

local result = examinees:create_examinees_batch(data)

res.ok(result)
