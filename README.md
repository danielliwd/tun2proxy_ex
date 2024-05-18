# tun2proxy_ex

tun2proxy in docker

## quick start

1. 启动代理服务

   代理服务必需是监听在 `:6245` 且非 `127.0.0.1`, 否则docker容器内无法访问到

   如果已有代理，比如监听在 `7890`, 可以能过`socat`把端口映射到 `*:6245`

   ```bash
   socat TCP-LISTEN:6245,fork,keepalive,reuseaddr,rcvbuf=131071 TCP:127.0.0.1:7890
   ```

1. build镜象

   ```bash
   sh build.sh
   ```

   这会产生一个镜象`debian_tun`

1. 启动容器

   ```bash
   PROXY_IP=192.168.2.10 PROXY_PORT=6245 sh ./run_docker.sh
   ```

   启动后，会执行`setup.rc`, 设置完毕会输出容器通过代理的出口地址

## 脚本说明

1. `scripts/entrypoint.sh`
   容器的入口脚本

1. `scripts/setup.rc`

   创建tun设备
   设置ip route
   启动tun2proxy

1. `scripts/bashrc`
   容器命令行交互的初始化配置

## 常见问题

1. 为什么出口地址不是代理地址

   先看看`/app/t.log`日志输出
   再看看代理服务是否使用了路由(如clash, 其规则决定了出口，最后一行一般是: `- MATCH,Final`, 会使用Final这个proxy-group, ip容易miss很多规则，最后匹配Final)
