//: [Previous](@previous)

//: ### 1.2 扩展自定义类型
//: 除了系统框架中的类型之外，我们自己定义的类型当然也可以扩展。
//: 可是完全由自己控制的类型为什么还需要扩展呢？

//: 首先，把一组相关功能放进扩展有助于增加可读性和可维护性，使接口保持整洁。
//: 除此之外，以下几种情况也是扩展的常见用途。

//: #### 1.2.1 扩展结构体添加自定义初始化方法

//: 在结构体内添加自定义初始化方法时，不再会生成默认初始化方法
struct Rect1 {
    var width: Double
    var height: Double

    init() {
        width = 0
        height = 0
    }
}

//: 将自定义初始化方法放到扩展中，可以保留默认初始化方法
public struct Rect2 {
    var width: Double
    var height: Double
}

extension Rect2 {
    init() {
        width = 0
        height = 0
    }
}

let r1 = Rect1()
//let r1s = Rect1(width: 10, height: 10)
let r2 = Rect2(width: 10, height: 10)

//: #### 1.2.2 扩展嵌套类型

extension Rect2 {
    enum Kind {
        case invalid // width <= 0 || height <= 0
        case square // width = height
        case tall // width < height
        case flat // width > height
    }

    var kind: Kind {
        if width <= 0 || height <= 0 {
            return .invalid
        } else if width == height {
            return .square
        } else if width > height {
            return .flat
        } else {
            return .tall
        }
    }
}

//: #### 1.2.3 统一访问级别

//: 使用访问控制关键字声明扩展，可以统一扩展内所有成员的访问级别。
//: 样例详见Sources目录下的[Rect.swift](Sources/Rect.swift)

//: ![code](public_extension.png)
//: 该`public`扩展中的`area`与`perimeter`均自动被声明为`public`，可在module外（如本文件）访问。
let rect = Rect()
rect.area
rect.perimeter

//: 另外值得一提的是，与类型声明在同个文件内的扩展，可以访问该类型的`private`属性/方法，因此可以毫无障碍地在同一文件内将单个类型拆分为多个扩展。

//: [Next](@next)
