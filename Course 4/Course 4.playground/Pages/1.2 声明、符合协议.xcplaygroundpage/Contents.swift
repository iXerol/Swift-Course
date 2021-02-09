//: [Previous](@previous)

//: ### 1.2 声明、符合协议

//: 声明`Namable`协议，具有`String`类型`name`可读属性。
//: [协议通常命名为英语形容词或名词。](https://swift.org/documentation/api-design-guidelines/#strive-for-fluent-usage)形容词表示一种能力，如`-able`, `-ible`, `-ing`；名词表示这是什么，如`Collection`, `-Delegate`。
protocol Namable {
    var name: String { get }
}

//: 声明类型符合协议的语法与继承一样，在类型名后加冒号`:`与协议名。
//: Swift中除函数外所有类型都可以符合协议，包括结构体、类与枚举。
struct Person: Namable {
    var name: String
    var age: Int
}

struct Commodity: Namable {
    var name: String
    var price: Double
}

//: 对于符合`Namable`协议的类型都能使用`printName(of:)`函数打印其名字
func printName(of object: Namable) {
    print(object.name)
}

let swift = Person(name: "Swift", age: 6)
let mba = Commodity(name: "MacBook Air", price: 7999)
printName(of: swift)
printName(of: mba)

//: [Next](@next)
