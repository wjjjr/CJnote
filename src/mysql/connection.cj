package CJnote.mysql
import litem.bootstrap.DatabaseHelper
import std.database.sql.DriverManager
import mysql.cdbc.MySqlDriver
public class Mysql{

    public init(){
    print("[调试] 开始执行file_global_init，准备创建数据源")
    var driver = DriverManager.getDriver("mysql").getOrThrow()
    var username = ("username", "root")
    var password = ("password", "123456")
    var database = ("database", "cjnote")
    var dataSource = driver.open("mysql:mysql://localhost:3306", [username, password, database])
    DatabaseHelper.setDatasource(dataSource)
    }
}