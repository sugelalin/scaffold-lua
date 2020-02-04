
local cjson = require("cjson")

local ok, data = pcall(cjson.decode, ngx.arg[1])
if ok then
    ngx.ctx.responseData = data
end