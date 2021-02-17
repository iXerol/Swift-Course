//: [Previous](@previous)

//: ### 2.2 协议继承与组合

//: #### 2.2.1 协议继承
//: Swift的协议也支持继承，可以在父协议的基础上添加子协议的额外要求。
protocol Shape {
    var area: Double { get }
    var perimeter: Double { get }
}

//: 协议继承的语法与类继承语法一致
protocol Polygon: Shape {
    var sides: [Double] { get }
}

struct Square: Polygon {
    var side: Double

//: 符合`Polygon`协议必须提供以下三个可读属性
    var sides: [Double] { [side, side, side, side] }
    var area: Double { side * side }
    var perimeter: Double { side * 4 }
}

let square = Square(side: 4)
square.area
square.perimeter
square.sides

//: #### 2.2.2 协议组合
//: 协议继承能够很方便地根据现有的一个或一组协议产出新协议，但是有时候我们需要的「新协议」是由几个不直接相关的协议组成的，此时使用继承并不合适。
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

//: 使用`&`中缀操作符连接多个协议，把多个协议组合成单个需求
func sayHappyBirthDay(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let bili_33 = Person(name: "33", age: 10)
sayHappyBirthDay(to: bili_33)

//: 协议组合与如下的多继承协议不同，下面这种方式会产生一个新协议。如果要求符合`NamedAndAged`协议的类型，则`Person`等没有声明过符合协议的类型会被判定为不符合；而使用协议组合不产生新协议，不会存在此问题。
protocol NamedAndAged: Named, Aged { }
Person.self is NamedAndAged.Type
Person.self is (Named & Aged).Type

//: [Next](@next)
