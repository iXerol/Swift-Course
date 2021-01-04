//: [Previous](@previous)
//: ### 4.3 可空类型进阶

//: #### 可空链式调用
//: 使用可空字符串生成全大写的新字符串，需要在链式调用的点语法前添加问号（`?`）。
var optionalString: String? = "bilibili"
let upCaseString = optionalString?.uppercased()
//: 也可以通过可空链式调用在原地修改自身的值
optionalString?.append("🍻")
print(optionalString as Any)

//: 隐式解包：在声明可空变量类型时使用感叹号（`!`）替换问号（`?`）。
//: 在进行链式调用时无需添加问号，会自动进行解包操作。当然也可以添加问号来增加安全性。
var myString: String!
print(myString as Any)
// print(myString.uppercased())
print(myString?.uppercased() as Any)

myString = "Hello, Swift!"
print(myString as Any)
print(myString.uppercased())
//: ⚠️隐式解包与强制解包一样不安全，必须由使用方确保其值非空。
//: 在与 Objective-C 桥接时，未声明 `nonnull`/`nullable` 的对象会被转换为隐式解包类型。

//: 一个常见的可空类型操作：有值时取值，无值时赋默认值。
//: 当然可使用可空实例绑定完成
var nonnullString: String
if let str = optionalString {
    nonnullString = str
} else {
    nonnullString = "It's nil"
}
//: 使用 `??` 运算符可以更简单地实现等价操作
nonnullString = optionalString ?? "It's nil"
print(nonnullString)
optionalString = nil
nonnullString = optionalString ?? "It's nil"
print(nonnullString)

//: [Next](@next)
