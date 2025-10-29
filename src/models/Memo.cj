package CJnote.models

public class Memo {
    var id: Int64
    var title: String
    var content: String

    init(id: Int64, title: String, content: String) {
        this.id = id
        this.title = title
        this.content = content
    }

    static func createMemo(id: Int64, title: String, content: String): Memo {
        return Memo(id, title, content)
    }

    static func getMemoDetails(memo: Memo): String {
        return "Memo ID: ${memo.id}, Title: ${memo.title}, Content: ${memo.content}"
    }
}