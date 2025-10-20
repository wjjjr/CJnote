package CJnote.controllers

import cjoy.*
import CJnote.models.Memo

class MemoController {
    private var memos: List[Memo] = []

    def createMemo(ctx: JoyContext): Unit = {
        let title = ctx.getParam("title") ?? "Untitled"
        let content = ctx.getParam("content") ?? ""
        let newMemo = Memo.create(title, content)
        memos = memos :+ newMemo
        ctx.json(newMemo)
    }

    def getMemos(ctx: JoyContext): Unit = {
        ctx.json(memos)
    }

    def deleteMemo(ctx: JoyContext): Unit = {
        let id = ctx.getParam("id") ?? ""
        memos = memos.filter(memo => memo.id != id)
        ctx.string("Memo deleted")
    }
}