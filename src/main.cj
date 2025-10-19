package CJnote

import cjoy.*

main(): Int64 {
    // 创建joy实例
    let joy = Joy.default()
    // 带参路由：GET /{name}
    joy.router.get("/{name}", {ctx: JoyContext => 
        let name = ctx.getParam("name") ?? "no name"
        ctx.string("name in parameter path, name=${name}")
    })
    // 静态路由：GET /abc
    joy.router.get("/abc", {ctx: JoyContext => 
        ctx.string("static path abc")
    })
    // 启动服务
    joy.run("127.0.0.1", 18881)
    return 0
}