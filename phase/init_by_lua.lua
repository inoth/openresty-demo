----* lib *----
cjson = require "cjson"
cjson_safe = require "cjson.safe"

----* config *----
cfg = require "config/config_util"

----* util *----
log = require "libs/log"
log:init(cfg.server_name)

res = require "libs/result"
err = require "libs/err"
util = require "libs/util"
