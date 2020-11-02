//: [Previous](@previous)

//: 从其他类型转换到 `Any` 类型一定可行，使用 `as` 进行转换
let any = "Hello, playground" as Any

//: 编译器无法判断 `Any` 到 其他类型的转换是否可行，使用 `as?` 转换得到可空类型值
var anyString: String?
anyString = any as? String
print(anyString)
let anyInt = any as? Int
print(anyInt)
print(type(of: anyString))

//: 可空类型的声明方式为在类型后添加问号
//: 可能有相应类型的值，或空值 `nil`

//: 通过与 `nil` 判等对可空值进行判空
//: 可使用 `!` 对可空值进行强制解包
if anyString != nil {
    let str = anyString!
    print(str)
    print(type(of: str))
}

//: 强制解包风险极高，对空值进行强制解包会直接崩溃，强烈不建议使用
//_ = anyInt!

//: 使用 `if let` 进行可空实例绑定
if let str = anyString {
    //: `str` 为非空的临时变量
    print(str)
} else {
    //: `anyString` 为空
}

//: [Next](@next)
