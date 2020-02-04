local lor = require("lor.index")
local router = require("app.router")
local app = lor()

router(app) -- 业务路由处理
-- 错误处理插件，可根据需要定义多个
app:erroruse(function(err, req, res, next)
    res:status(500):json({
        code = 0,
        msg = "未知错误",
    })
end)

return app
