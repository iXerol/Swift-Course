//: [Previous](@previous)
import CoreGraphics

//: ### 2.3 类型扩展符合协议

//: 这是扩展的一个重要用途。有些时候我们需要某个类型符合特定协议才能在特定场合下使用，但该类型本身并没有符合该协议，此时通过扩展便可满足该需求。
extension CGRect: Shape {
    public var area: CGFloat { size.width * size.height }

    public var perimeter: CGFloat { 2 * (size.width + size.height) }
}

extension CGRect: Polygon {
    public var sides: [CGFloat] { [size.width, size.height, size.width, size.height] }
}

var shape: Shape
shape = CGRect.zero

//: 协议要求的属性/方法并不一定要在对应扩展中声明，只要该类型满足协议要求，即使扩展内部为空都可以。

//: [Next](@next)
