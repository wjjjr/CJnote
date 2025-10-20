package CJmemo

import cjoy.*
import controllers.MemoController
import routes.Routes

main(): Int64 {
    // 创建cjoy实例
    let joy = Joy.default()

    // 设置路由
    Routes.setup(joy.router)

    // 启动服务
    joy.run("127.0.0.1", 18881)
    return 0
}