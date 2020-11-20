//: [Previous](@previous)

//: 无返回值
func someFunc1() {
}
someFunc1()

//: 有返回值
func someFunc2() -> String {
    return "some value"
}
print(someFunc2())

//: 有参数
func someFunc3(param: String) -> String {
    return "some value\(param)"
}
print(someFunc3(param: "abc"))

//: 多返回值
func someFunc4(param: String) -> (value1: String, value2: String) {
    return (param, "is \(param)")
}
print(someFunc4(param: "abc"))

//: 可选返回值
func someFunc5(param: String) -> String? {
    return nil
}
if let value = someFunc5(param: "abc") {
    print(value)
}

//: 缺省参数
func someFunc6(param: String, param2: String = "123") -> String? {
    return param + param2
}
if let value2 = someFunc6(param: "abc") {
    print(value2)
}
if let value3 = someFunc6(param: "abc", param2: "def") {
    print(value3)
}

//: 实参 在提供形参之前写实参标签，用空格分隔
//: 如果你为一个形参提供了实参标签，那么就必须在调用函数的时候使用实参标签
//: 函数标签通常为符合英文语境的介词
func someFunc7(person: String, from hometown: String) -> String {
    return "\(person) is come from \(hometown)"
}
print(someFunc7(person: "lilei", from: "shanghai"))

//: 省略实参标签
func someFunc8(_ param: String) -> String {
    return param
}
print(someFunc8("ignore param"))

//: 可变参数  一个函数最多只能有一个可变形式参数
func someFunc9(_ params: String...) -> String {
    var value: String = ""
    for param in params {
        value = value + param
    }
    return value
}
print(someFunc9("a", "b", "c", "d", "e", "f", "g", "h"))

//: [Next](@next)
