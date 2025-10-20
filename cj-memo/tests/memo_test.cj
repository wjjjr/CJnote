package tests

import cjoy.*
import src.controllers.MemoController

testMemoController(): Int64 {
    let controller = MemoController()

    // 测试创建备忘录
    let createResponse = controller.createMemo("Test Memo", "This is a test memo.")
    assert(createResponse.status == 201)
    assert(createResponse.body.title == "Test Memo")
    assert(createResponse.body.content == "This is a test memo.")

    // 测试获取备忘录
    let getResponse = controller.getMemos()
    assert(getResponse.status == 200)
    assert(getResponse.body.size() > 0)

    // 测试删除备忘录
    let deleteResponse = controller.deleteMemo(createResponse.body.id)
    assert(deleteResponse.status == 204)

    return 0
}