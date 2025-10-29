package CJnote.routes
import CJnote.middleware.*
import cjoy.*
import CJnote.controllers.MemoController
//import CJnote.services.storage
// import CJnote.models.Memo
import std.fs.*
public class Routes{
// 设置路由

public func setupRoutes(joy: Joy) {

    joy.router.use(CustomCors())
   
        joy.router.options("/*", { ctx: JoyContext =>
        // 若需要可根据请求 Origin 限制来源
        ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_ORIGIN, "*")
        ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_METHODS, "GET, POST, PUT, DELETE, OPTIONS")
        ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_ALLOW_HEADERS, "Content-Type, Authorization")
        ctx.header(JoyHttpConsts.HEADER_ACCESS_CONTROL_MAX_AGE, "86400")
        ctx.ok()
    })
     let memoController = MemoController()
    //joy.router.staticFs("/static", "./")
    //joy.router.staticFs("/", "src/templates/")
    // 创建备忘录：POST /memos
    joy.router.post("/memos/addmemos", { ctx: JoyContext => 
        memoController.createMemo(ctx)
    })

    // 获取所有备忘录：GET /memos
    joy.router.get("/memos/getmemos", { ctx: JoyContext => 
        memoController.getMemos(ctx)
    })

    // 删除备忘录：DELETE /memos/{id}
    joy.router.delete("/memos/deletememos", { ctx: JoyContext => 
        memoController.deleteMemo(ctx)
    })

    joy.router.put("/memos/updatememosTaC", { ctx: JoyContext => 
        memoController.updateMemo(ctx)
    })

    // 把 src/static 映射到 /static 路径（浏览器访问 /static/... 即可）
    //joy.router.get("/static", "./templates/index.tpl")

    // // 实例化存储（根据你的 Storage 实现调整）
    // let store = storage.Storage()

    // // 根页面，渲染 templates/index.tpl，传入数据
    // joy.router.get("/", (ctx: JoyContext) => {
    //     let data = {tpl
    //         "title": "备忘录",
    //         "memos": store.getMemos()
    //     }
    //     ctx.render("index.tpl", data)   // 若框架方法名不同请替换为实际 render 方法
    // })

    // // 简单 API：获取备忘录列表
    // joy.get("/api/memos", (ctx: JoyContext) => {
    //     ctx.json(store.getMemos())
    // })

    // // 添加、删除示例接口（按需实现）
    // joy.post("/api/memos", (ctx: JoyContext) => {
    //     let title = ctx.getParam("title") ?? "Untitled"
    //     let content = ctx.getParam("content") ?? ""
    //     let m = Memo.create(title, content) // 按你的 Memo 实现调整
    //     store.addMemo(m)
    //     ctx.json(m)
    // })

    // joy.delete("/api/memos/:id", (ctx: JoyContext) => {
    //     let idStr = ctx.param("id") ?? "0"
    //     let id = Int64.parse(idStr) ?? 0
    //     store.deleteMemo(id)
    //     ctx.string("ok")
    // })
}
}