package CJnote.dao
import CJnote.entity.*
import litem.bootstrap.DatabaseHelper
import litem.auto.*
import std.collection.*
public class MemoDao {
    private let memoBaseDao: MemoEntityBaseDao = MemoEntityBaseDao(DatabaseHelper.getDatabase())

    public init() {}

    public func insert(memoEntity: MemoEntity): Int64 {
        return this.memoBaseDao.insert(memoEntity)
    }

    public func update(memoEntity: MemoEntity, fields: Array<String>) {
        //print("${memoEntity.title}++++++++++++++++++++++/n")
        //print("${fields[0]}++++++++++++++++++++++/n")
        this.memoBaseDao.updateOptional(memoEntity, fields)
    }

    public func query(): List<MemoEntity>{

        return this.memoBaseDao.queryByCondition({memoEntity: MemoEntitys, condition: EntityCondition =>
        })
    }

    // public func queryOneByCondition(condition: (MemoEntitys, EntityCondition) -> Unit): ?MemoEntity {
    //     return this.memoBaseDao.queryOneByCondition(condition)
    // }

    // public func queryByCondition(condition: (MenuEntitys, EntityCondition) -> Unit): ArrayList<MenuEntity> {
    //     return this.menuBaseDao.queryByCondition(condition)
    // }

    // public func pageByCondition(pageNum: Int64, pageSize: Int64, condition: (MenuEntitys, EntityCondition) -> Unit) {
    //     return this.menuBaseDao.pageByCondition(pageNum, pageSize, condition)
    // }

    public func deleteById(condition: (MemoEntitys, EntityCondition) -> Unit) {
        this.memoBaseDao.deleteByCondition(condition)
    }
    // public func update(memo:MemoEntity,fields:Array<String>){
    //     this.memoBaseDao.updateOptional(memo,fields)
    // }
}