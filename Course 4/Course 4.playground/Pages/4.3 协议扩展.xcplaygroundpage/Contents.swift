//: [Previous](@previous)

//: ### 4.3 协议扩展

//: Swift的协议也支持扩展，在扩展中提供协议通用的方法实现。
protocol Shape {
    var area: Double { get }
    var perimeter: Double { get }
}

protocol Polygon: Shape {
    var sides: [Double] { get }
}

//: 扩展`Polygon`协议
extension Polygon {
//: 提供`perimeter`的默认实现
    var perimeter: Double {
        return sides.reduce(0, +)
    }
    
//: 也可以提供协议不要求的额外计算属性/方法。
    var numberOfSides: Int {
        print("This polygon has \(sides.count) sides.")
        return sides.count
    }
}

struct Square: Polygon {
    var side: Double

    var sides: [Double] { [side, side, side, side] }
    var area: Double { side * side }
//: 不需要提供`perimeter`属性，因为在`Polygon`的扩展中已经有默认实现。
//: 若有不同于默认实现的需求，也可以选择重写。比如此例中默认实现效率低，可以通过重写来提升效率。
//    var perimeter: Double { side * 4 }
}

let square = Square(side: 10)
square.perimeter
let polygon: Polygon = square
polygon.perimeter

extension Square {
//: ⚠️对于协议不要求，但在协议扩展中实现了的方法，即使被符合协议的类型重写，声明为该协议的实例也不会调用到该方法。
    var numberOfSides: Int {
        print("Square has four sides.")
        return 4
    }
}
square.numberOfSides
polygon.numberOfSides
//: 这种现象是因为Swift方法在编译时决议，静态调用。
//: 对于声明为该协议的实例，在编译期能确定的只是具体类型实现了协议要求的内容，可能为该类型特有的实现或协议扩展中的默认实现。
//: 但协议本身不要求的内容，编译时无法得知实现的具体类型对该方法的重写，只能得知协议扩展中的实现。

//: [Next](@next)
