//: [Previous](@previous)

//: ### 1.3 关联值

//: 可为枚举的每个 `case` 定义相应的关联值，以元组的形式定义在对应枚举值之后
enum Shape {
    // 正方形的关联值是边长
    case square(side: Double)
    // 长方形的关联值是宽和高
    case rectangle(width: Double, height: Double)
    // 点没有关联值
    case point

//: 枚举可添加方法，语法与函数相同
    func area() -> Double {
//: 使用 `self` 表示自身的值
        switch self {
//: 使用 `let` 将枚举关联值值绑定到临时常量上
        case .square(let side):
            return side * side
//: 值绑定 `let` 的位置可在关联值前也可在枚举值前，元组标签可以省略。以下三种写法等价
//        case .rectangle(let w, let h):
//        case let .rectangle(w, h):
        case let .rectangle(width: w, height: h):
            return w * h
        case .point:
            return 0
        }
    }
}

let square = Shape.square(side: 10.0)
print("Square's area is \(square.area())")
let rect = Shape.rectangle(width: 10.0, height: 5.0)
print("Rect's area is \(rect.area())")
let point = Shape.point
print("Point's area is \(point.area())")

//: [Next](@next)
