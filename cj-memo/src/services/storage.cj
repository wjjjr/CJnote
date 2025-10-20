package CJnote.services

import cjoy.*
import std.file.*

let storageFilePath = "memos.json"

class Storage {
    private var memos: Array[Memo] = []

    init() {
        loadMemos()
    }

    private fun loadMemos() {
        if (File.exists(storageFilePath)) {
            let content = File.read(storageFilePath)
            memos = Json.parseArray[Memo](content) ?? []
        }
    }

    fun saveMemos() {
        let content = Json.stringify(memos)
        File.write(storageFilePath, content)
    }

    fun addMemo(memo: Memo) {
        memos.push(memo)
        saveMemos()
    }

    fun getMemos(): Array[Memo] {
        return memos
    }

    fun deleteMemo(id: Int64) {
        memos = memos.filter(memo => memo.id != id)
        saveMemos()
    }
}