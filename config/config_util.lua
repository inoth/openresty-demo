local config_util = {
}

config_util.server_name = "demo-app"

config_util.db_config = {
    host = "localhost",
    port = 3306,
    database = "database",
    user = "user",
    password = "1234567890",
    timeout = 5000
}

return config_util
