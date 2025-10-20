package CJnote.routes

import cjoy.*
import CJnote.controllers.MemoController

// 设置路由
fun setupRoutes(joy: Joy) {
    let memoController = MemoController()

    // 创建备忘录：POST /memos
    joy.router.post("/memos", { ctx: JoyContext => 
        memoController.createMemo(ctx)
    })

    // 获取所有备忘录：GET /memos
    joy.router.get("/memos", { ctx: JoyContext => 
        memoController.getMemos(ctx)
    })

    // 删除备忘录：DELETE /memos/{id}
    joy.router.delete("/memos/{id}", { ctx: JoyContext => 
        memoController.deleteMemo(ctx)
    })
}