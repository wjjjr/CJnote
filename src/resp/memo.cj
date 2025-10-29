package CJnote.resp
import cjoy.bind.*
import std.deriving.*
import cjoy.validation.*
import cjoy.json.*
import std.time.DateTime
import cjjson.macros.*
import cjjson.*
@Valid
@Json
@Derive[ToString]
public class MenuInsertReq {
    @NumberRange[min = 1, msg="系统ID必须大于0"]
    public var mId: Int64 = 0
    
    
    public var title: String = ""
    public var context: String = ""
    public var stime: DateTime = DateTime.now()
    public var etime: DateTime = DateTime.now()
}

@JsonAdapter[withGenericType = T]
public class ListResponse<T> {
    public var list: Array<T> = Array<T>()

    public init() {

    }

    public init(list: Array<T>) {
        this.list = list
    }
}