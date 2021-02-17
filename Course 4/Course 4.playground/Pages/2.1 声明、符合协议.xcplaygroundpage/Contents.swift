//: [Previous](@previous)

//: ### 2.1 声明、符合协议

//: 声明`Named`协议，具有`String`类型`name`可读属性。
//: [协议通常命名为英语形容词或名词。](https://swift.org/documentation/api-design-guidelines/#strive-for-fluent-usage)形容词表示一种能力，如`-able`, `-ible`, `-ing`；名词表示这是什么，如`Collection`, `-Delegate`。
protocol Named {
//: 协议内的语法与结构体/类的属性、方法声明一致，只是不包含方法的内容。
//: 协议可以包含属性（只要求`get`或既可`get`也可`set`）、方法、类型方法、初始化方法等
    var name: String { get }

    func printName()
}

//: 声明类型符合协议的语法与继承一样，在类型名后加冒号`:`与协议名。
//: Swift中除函数外所有类型都可以符合协议，包括结构体、类与枚举。
struct Person: Named {
    var name: String
    var age: Int

    func printName() {
        print(name)
    }
}

struct Commodity: Named {
    var name: String
    var price: Double

    func printName() {
        print(name)
    }
}

//: 可以将协议类型作为函数参数。
//: 对于符合`Named`协议的类型都能使用`printName(of:)`函数打印其名字
func printName(of object: Named) {
    print(object.name)
}

//: 可以将协议作为声明常量/变量的类型
let swift: Named
swift = Person(name: "Swift", age: 6)
let mba = Commodity(name: "MacBook Air", price: 7999)
swift.printName()
mba.printName()
printName(of: swift)
printName(of: mba)

//: [Next](@next)
