local util = {}

function util.get_body()
    ngx.req.read_body()
    local body = ngx.req.get_body_data()
    if nil == body then
        err.params_err("body is null")
    end
    body = cjson_safe.decode(body)
    if nil == body then
        err.params_err("decode body failed")
    end
    return body
end

function util.string_join(str, split_chr)
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

return util
