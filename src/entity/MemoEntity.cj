package CJnote.entity
import litem.auto.*
import litem.macros.{TableEntities, TableColumn}
import std.time.DateTime
import std.deriving.*
import cjoy.bind.*
import std.deriving.*
import cjoy.validation.*
import cjoy.json.*
// @Valid
// @Json
// @Derive[ToString]
@TableEntities["memo"]
public class MemoEntity {
    public MemoEntity() {}

    @TableColumn[primaryKey, defaultValue = 0]
    public mut prop mid: Int64 {
    }

    @TableColumn[defaultValue = ""]
    public mut prop title: String {
    }

    @TableColumn[defaultValue = ""]
    public mut prop context: String {
    }

    @TableColumn[defaultValue = 0]
    public mut prop status: Int8 {
    }

    @TableColumn[defaultValue = DateTime.now()]
    public mut prop stime: DateTime

    @TableColumn[defaultValue = DateTime.now()]
    public mut prop etime: DateTime

}