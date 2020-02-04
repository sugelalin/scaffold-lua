-- TODO:

local hc = require('resty.upstream.healthcheck')
local function spawnChecker(premature)
    if premature then
        return
    end
    ngx.log(ngx.ERR, "ngx.worker.id=" .. ngx.worker.id())
    -- if ngx.worker.id() == 1 then
        local ok, err = hc.spawn_checker {
            shm = "healthcheck",
            upstream = "localhost-upstream",
            type = "http",
            http_req = "GET /status HTTP/1.0\r\nHost: 127.0.0.1\r\n\r\n",
            interval = 3000,
            timeout = 1000,
            fall = 2,
            rise = 2,
            valid_statuses = {200, 302},
            concurrency = 1,
        }
        ngx.log(ngx.ERR, ok)
        if not ok then
            ngx.log(ngx.ERR, "failed to spawn health checker: ", err)
            return
        end
        -- ngx.timer.at(2, updateMemList)
    -- end
end

ngx.timer.at(0, spawnChecker)
