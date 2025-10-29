
package CJnote.req
import CJnote.entity.*
import cjjson.macros.*
import cjjson.*
import cjoy.json.*
import cjoy.validation.*
import std.deriving.*
import cjoy.bind.*

public const TimeFormatPattern = "yyyy-MM-dd HH:mm:ss"
@JsonAdapter
public class MemoReq {
    public var id: Int64 = 0
    public var title: String = ""
    public var content: String = ""
    public var createdAt: String = ""
    public var etime: String = ""
    public var status: Int8 = 0
    public var isImportant: Int8 = 0
    public var isCompleted: Int8 = 0

    public init() {

    }

    public init(memoEntity: MemoEntity) {
        this.id = memoEntity.mid
        this.content = memoEntity.context
        this.createdAt = memoEntity.stime.format(TimeFormatPattern)
        this.etime = memoEntity.etime.format(TimeFormatPattern)
        this.title = memoEntity.title
        this.status = memoEntity.status
        if(memoEntity.status==1){
            this.isImportant = 1
        }
        if(memoEntity.status==2){
            this.isCompleted = 1
        }
    }
}
@JsonAdapter
public class memoID {
    public var id: Int64 = 0
    public init(){
        
    }
    public init(id: Int64){
        this.id = id
    }
}

@Valid
@Bind
@Derive[ToString]
public class MemoIdReq {
    @NumberRange[min = 1,msg="id 必须大于 0"]
    public var id: Int64 = 0
}

@Valid
@Json
@Derive[ToString]
public class AddMemoIdReq {
    public var title: String = ""
    public var context: String = ""
}


@Valid
@Json
@Derive[ToString]
public class UpdateMemoIdReq {
    @NumberRange[min = 1,msg="id 必须大于 0"]
    public var id: UInt64 = 0
    public var title: String = ""
    public var context: String = ""
    public var status: UInt64 = 0
}