import CoreGraphics

public protocol Shape {
    var area: CGFloat { get }
    var perimeter: CGFloat { get }
}

//: 协议继承的语法与类继承语法一致
public protocol Polygon: Shape {
    var sides: [CGFloat] { get }
}
