//: [Previous](@previous)
//#-hidden-code
import Foundation
//#-end-hidden-code

//#-editable-code
//: ### 1.2 类

//: 创建一个描述B站用户的类
class User {
    /// 用户ID
    let mid = 2233
    /// 入站时间戳
    let jointime: TimeInterval = 1_333_333_333
    // 用户名
    var name = "bilibili"
    // 头像
    var face = "bilibili.jpg"

    // 实例方法
    func printDespriction() {
        print("ID：\(mid)",
              "入站时间：\(Date(timeIntervalSince1970: jointime))",
              "用户名：\(name)",
              "头像：\(face)",
              separator: "\n",
              terminator: "\n\n")
    }

//: 与结构体不同，修改属性值的方法**不**需添加 `mutating` 关键字
    func changeName(to name: String) {
//: 属性与临时常量/变量同名时加上`self.`表示属性
        self.name = name
    }
}
//: 四个属性，ID与入站时间戳不可变，用户名、头像可变

//: 使用`let`声明的类的常量实例也可以修改可变属性
let user = User()

//: 点语法获取属性
print("ID：\(user.mid)",
      "入站时间：\(Date(timeIntervalSince1970: user.jointime))",
      "用户名：\(user.name)",
      "头像：\(user.face)",
      separator: "\n",
      terminator: "\n\n")

//: 点语法调用函数
user.printDespriction()

//: 修改属性值
user.changeName(to: "哔哩哔哩")
user.face = "2233.png"
//: 常量属性不可修改
//user.mid = 222333
user.printDespriction()
//#-end-editable-code

//: [Next](@next)
