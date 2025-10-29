package CJnote.controllers
import CJnote.resp.*
import cjoy.*
import CJnote.models.*
import CJnote.entity.*
import std.collection.*

import CJnote.services
import cjoy.json.*
import CJnote.req.*
//import 
    @Json
    class UserInfo {
    var id: String = "666"
    }
public class MemoController {
    var memos = ArrayList<MemoEntity>()
    var storage = services.Storage()

//     public func RoleInsert(ctx: JoyContext) {
//     let req = ctx.bindJsonBody<RoleInsertReq>().getOrThrow()
//     req.validate()
//     let id = service.roleService.insert(ctx, req)
//     ctx.json(Response<IdResponse>(IdResponse(id)).toJson())
//     ()
// }
    public func createMemo(ctx: JoyContext): Unit  {
        let req = ctx.bindJsonBody<AddMemoIdReq>().getOrThrow()
            req.validate()
        //var title = req.title ?? "Untitled"
       // var content = req.context ?? ""
       print("####################################${req.title}#######")
        let newMemo = MemoEntity()
        newMemo.title = req.title
        newMemo.context = req.context
        let id = storage.addMemo(newMemo)
        //memos = memos.add(newMemo)
        let reqid = memoID(Int64(id))
        ctx.json(reqid.toJson())
        (200,newMemo)
    }

    public func getMemos(ctx: JoyContext) {
        print("调用成功")
        let memos = storage.getMemos()
       // print(memos.get(0))
       print("#######################################")
       //print(memos.size)
    //     let memo = memos.get(0)
    //    print(memo.title)
        //print(memos.mid)
        let userjosn = UserInfo()
       ctx.json(memos.toJson())
       ()
       //(200,memos)
    }

    public func deleteMemo(ctx: JoyContext): Unit  {
        let req = ctx.bindQuery<MemoIdReq>().getOrThrow()
    req.validate()
    print("#########################${req}/n")
        //var id :UInt8= UInt8(ctx.getParam("id")) ?? ""
        //memos = memos.filter( {memo => memo.id != id} )
        storage.deleteMemo(UInt8(req.id))
        (200,"success")
    }
    public func updateMemo(ctx: JoyContext): Unit{
            let req = ctx.bindJsonBody<UpdateMemoIdReq>().getOrThrow()
            req.validate()
            print("000000000000000000000${req.status}0000000000")
            let memo = MemoEntity()
            memo.title = req.title
            memo.context = req.context
            memo.mid = Int64(req.id)
            memo.status = Int8(req.status)
            print("${req.title}9----------------/n")
            storage.updateMemos(memo)
            let reqid = memoID(Int64(req.id))
            ctx.json(reqid.toJson())
            (200)
    }
}