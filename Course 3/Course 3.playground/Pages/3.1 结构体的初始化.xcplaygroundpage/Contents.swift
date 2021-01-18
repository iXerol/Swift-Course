//: [Previous](@previous)

//: ## 3 初始化

//: ### 3.1 结构体的初始化

//: 结构体和类的（非惰性）存储属性在初始化完成的时候需要有初始值。因此前几章节的大部分结构体和类的存储属性都设置了默认值。
//: 也可以使用初始化方法来确保存储属性有初始值，若有属性在初始化方法执行结束时无初始值则会在编译时报错。

//: 初始化方法为类型方法，但不需要写`static func`，使用`init`关键字即可

struct Point {
    var x: Double
    var y: Double
//: 可空属性的默认值是`nil`
    var z: Double?

//: 初始化方法参数和一般的方法一样可任意定义，只需要确保所有属性皆有默认值即可
    init() {
        x = 0.0
        y = 0.0
    }

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

let p1 = Point()
let p2 = Point(x: 3.0, y: 4.0)
print("p1's x is \(p1.x), y is \(p1.y)")
print("p2's x is \(p2.x), y is \(p2.y)")

//: 对于结构体，若不声明初始化方法，编译器则会自动提供一个默认初始化方法。
//: 默认成员初始化方法，会以所有属性名作为参数名，对属性进行初始化
struct Size {
    var width: Double
    var height: Double
}

let size = Size(width: 5.0, height: 6.0)
print("size's width is \(size.width), height is \(size.height)")

//: 如果所有属性都在声明时设置了默认值，则可以像前几章节一样使用不带参数的默认初始化方法

//: [Next](@next)
