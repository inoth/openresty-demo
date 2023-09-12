local err = {}

local ERR_CODE = {
    ["101"] = "请求参数错误",
    ["102"] = "解密失败",
    ["103"] = "token失效",
    ["104"] = "无效权限"
}

function err.exit_err(code, msg)
    msg = msg or ERR_CODE[tostring(code)]
    res.return_json(code, msg)
end

function err.params_err(msg)
    err.exit_err(101, msg)
end

function err.decrypt_err(msg)
    err.exit_err(102, msg)
end

function err.token_err(msg)
    err.exit_err(103, msg)
end

function err.auth_err(msg)
    err.exit_err(104, msg)
end

return err
