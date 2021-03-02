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

let square: Polygon
square = Square(side: 10)
square.perimeter


extension Square {
//: 对于协议不要求，但在协议扩展中实现了的方法，即使被符合协议的类型重写，声明为该协议的实例也不会调用到该方法。
    var numberOfSides: Int {
        print("Square has four sides.")
        return 4
    }
}
square.numberOfSides
//: 这种现象是因为Swift方法在编译时决议，静态调用。
//: 对于声明为该协议的实例，在编译期能确定的只是具体类型实现了协议要求的内容，可能为该类型特有的实现或协议扩展中的默认实现。
//: 但协议本身不要求的内容，编译时无法得知实现的具体类型对该方法的重写，只能得知协议扩展中的实现。

//: 如果需要使用可选实现，但不想声明`@objc`协议污染Swift环境，可以使用协议扩展来达到类似效果。
//: 在协议中声明一个方法，在协议扩展中提供默认空实现，
//: 如果符合协议的具体类型实现了该方法，则会调用到具体实现，否则则会调用到默认空方法。
protocol SessionDelegate: AnyObject {
    func willStart(_ session: Session)
    func didStart(_ session: Session)
}
extension SessionDelegate {
    func willStart(_ session: Session) { }
    func didStart(_ session: Session) { }
}
class Session {
    weak var delegate: SessionDelegate?

    func start() {
        delegate?.willStart(self)
        // ...
        delegate?.didStart(self)
    }
}

//: [Next](@next)
