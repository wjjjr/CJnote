package CJnote.models

class Memo {
    var id: Int64
    var title: String
    var content: String

    new(id: Int64, title: String, content: String) {
        this.id = id
        this.title = title
        this.content = content
    }

    static func createMemo(id: Int64, title: String, content: String): Memo {
        return new(id, title, content)
    }

    static func getMemoDetails(memo: Memo): String {
        return "Memo ID: ${memo.id}, Title: ${memo.title}, Content: ${memo.content}"
    }
}