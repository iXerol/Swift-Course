//: [Previous](@previous)

//: ## 2 协议

//: ### 2.0 没有协议时

//: 两个互不相关的结构体/类，但同时具有某些特性。

struct Person {
    var name: String
    var age: Int
}

struct Commodity {
    var name: String
    var price: Double
}

//: 人与商品都有各自的名字，但人和商品不存在继承、共同父类等关系。
//: 此时要实现打印各自名字的方法无法编写共同的函数，需要实现多份类似代码，难以维护。

func printName(of person: Person) {
    print(person.name)
}

func printName(of commodity: Commodity) {
    print(commodity.name)
}

let swift = Person(name: "Swift", age: 6)
let mba = Commodity(name: "MacBook Air", price: 7999)
printName(of: swift)
printName(of: mba)

//: [Next](@next)
