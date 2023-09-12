local result = {}

function result.ok(data)
    result.return_json(nil, nil, data)
end

function result.return_json(ret, err, data)
    ret = tonumber(ret) or 0
    err = err or ""

    local body = {}
    body["ret"] = ret
    body["err"] = err
    body["data"] = data
    if 0 ~= body["ret"] then
        ngx.header["X-IS-Error-Code"] = ret
        ngx.header["X-IS-Error-Msg"] = err
    end
    local body_text = cjson.encode(body)
    ngx.header.content_type = "application/json"
    ngx.header.Content_Length = string.len(body_text)
    ngx.header["Access_Control_Allow_Origin"] = "*"
    ngx.print(body_text)
    ngx.exit(ngx.HTTP_OK)
end

return result
