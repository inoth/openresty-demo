local args = ngx.req.get_uri_args()

res.return_json(nil, nil, {
    args = args,
    list = {
        {name = "inoth",id = 11},
        {name = "inoth",id = 11},
        {name = "inoth",id = 11},
        {name = "inoth",id = 11},
    }
})
