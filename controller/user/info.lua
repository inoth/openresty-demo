local args = ngx.req.get_uri_args()

local id = args.id or 1

res.return_json(nil, nil, {
    args = args,
    data = {
        name = "inoth123123",
        id = id
    }
})
