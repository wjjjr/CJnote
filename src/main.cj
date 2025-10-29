package CJnote
import cjoy.*
import std.fs.*
import yaml4cj.yaml.*
import cjoy.middleware.*
import litem.bootstrap.DatabaseHelper
import std.database.sql.DriverManager
import mysql.cdbc.MySqlDriver
 //import ./controllers/memo_controller
 //import ./routes/routes
//import CJnote.controllers.MemoController
import CJnote.routes
// public func initConfig() {
//     let pathName: String = "manifest/config.yaml"
//     let res = File.readFrom(pathName)
//     let jv = decode(res)
//     Config.Instance = Config.fromJsonValue(jv)
// }
    public func initMysql(){
    print("[调试] 开始执行file_global_init，准备创建数据源")
    var driver = DriverManager.getDriver("mysql").getOrThrow()
    var username = ("username", "root")
    var password = ("password", "123456")
    var database = ("database", "cjnote")
    var dataSource = driver.open("mysql:mysql://localhost:3306", [username, password, database])
    DatabaseHelper.setDatasource(dataSource)
    }
main(): Int64 {
     initMysql()

    let joy = Joy.default()
    // 设置路由
   
    let routes = routes.Routes()
    routes.setupRoutes(joy)

    // 启动服务
    joy.run("127.0.0.1", 18881)
    return 0
}