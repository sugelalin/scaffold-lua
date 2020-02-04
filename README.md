# knowbox-ngx-microservice

#### 项目介绍
使用基于 OpenResty（nginx+lua）+ Consul-template 实现的高性能微服务网关

#### 包含项目

用户微服务

```
路由：
http://micro-service.knowbox.cn/user-service/xxx/xxx

示例：
http://micro-service.knowbox.cn/user-service/user/get-user-by-token
```


短信微服务（暂未接入）

```
路由：
http://micro-service.knowbox.cn/sms-service/xxx/xxx

示例：
http://micro-service.knowbox.cn/sms-service/sms/send-sms
```

其他微服务

```

```

#### 目录结构
```$xslt
.
├── 3rdlibs
│   └── lua-resty-kafka
├── README.md
├── app
│   ├── main.lua
│   ├── middleware
│   ├── router.lua
│   └── server.lua
├── conf
│   ├── consul.d
│   ├── fastcgi.conf
│   ├── fastcgi.conf.default
│   ├── fastcgi_params
│   ├── fastcgi_params.default
│   ├── knowbox-conf
│   ├── koi-utf
│   ├── koi-win
│   ├── mime.types
│   ├── mime.types.default
│   ├── nginx-dev.conf
│   ├── nginx.conf
│   ├── nginx.conf.default
│   ├── scgi_params
│   ├── scgi_params.default
│   ├── services_tpl.ctmpl
│   ├── uwsgi_params
│   ├── uwsgi_params.default
│   └── win-utf
├── reload.sh
├── start.sh
└── stop.sh

1、conf/consul.d/ 目录下是接入的微服务的配置文件，比如user-service.json、sms-service.json
该配置文件在此处并不加载，仅做示例和汇总。需要将对应服务的配置文件放到对应的微服务项目中，并随项目初次部署（增加机器）时，通过cnosul agent 加载该配置一次即可。


2、conf/services_tpl.ctmpl 是consul-template 模板文件
consul-template 会从注册中心consul-cluster 拉取服务集合，根据模板文件，更新nginx配置文件且平滑重启nginx

```
