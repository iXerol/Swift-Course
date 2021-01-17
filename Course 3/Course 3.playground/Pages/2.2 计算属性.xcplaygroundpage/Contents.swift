//: [Previous](@previous)

//: ### 2.2 计算属性

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

//: 计算属性不存储值。读取（get）与设置（set）时分别调用无参数返回对应类型、以对应类型作为参数无返回值的闭包。这两个闭包称为`getter`方法、`setter`方法。
//: getter方法根据当前实例的状态返回对应数值。`setter`方法将其他属性设置到目标状态。
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
//: 在`set`后的圆括号内声明新变量名，可在闭包内使用。不声明则默认名为`newValue`。
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
//: 只读的计算属性可以省略`get`
    var perimeter: Double {
        return 2 * (size.width + size.height)
    }
//: 单行表达式可省略`return`
    var area: Double { size.width * size.height }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
print("square's area is \(square.area), initial center is (\(square.origin.x), \(square.origin.y))")
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//: [Next](@next)
