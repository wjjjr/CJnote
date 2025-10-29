package CJnote.services
import CJnote.dao
import cjoy.*
import CJnote.models.Memo
import CJnote.entity.*
import std.collection.*
import CJnote.req.*
import CJnote.resp.*
import litem.auto.*
import cjoy.json.*
//import std.json.*

public class Storage {
     var memos: List<MemoEntity> =  ArrayList<MemoEntity>()
     let memodao: dao.MemoDao = dao.MemoDao()
    public init() {}

    //  if (File.exists(storageFilePath)) {
    //         let content = File.read(storageFilePath)
    //          memos = Json.parseArray[Memo](content) ?? []
    //      }
    //  }

    public func addMemo(memoEntity: MemoEntity):Int64 {
        //memos.add(memoEntity)
         memodao.insert(memoEntity)
         return memoEntity.mid
    }

    public func getMemos(){
        memos = memodao.query()
        var re :List<MemoReq> = ArrayList<MemoReq>()
        for(me in memos){
            let memo:MemoReq = MemoReq(me)
            re.add(memo)
        }
        return ListResponse<MemoReq>(re.toArray())
    }

    public func deleteMemo(id: UInt8) {
        //memos = memos.filter({memo => memo.id != id} )
        let condition = {memoEntity: MemoEntitys, condition: EntityCondition =>
            condition.and(memoEntity.mid == id)
            ()
        }
        memodao.deleteById(condition)
    }

    public func updateMemos(memo: MemoEntity){
        let fields = ArrayList<String>(["title", "context","status"])
        memodao.update(memo,fields.toArray())
    }
}