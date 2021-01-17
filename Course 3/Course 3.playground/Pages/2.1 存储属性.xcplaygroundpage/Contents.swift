//: [Previous](@previous)

//: ## 2 属性

//: ### 2.1 存储属性
struct Polygon {
//: 一般存储属性
    let sides: [Double]
//: 惰性存储属性（懒加载），必须使用`var`声明
    lazy var numberOfSides = sides.count

//: 嵌套类型的存储属性
    enum BackgroundColor {
        case black
        case white
        case shadow
    }
    var backgroundColor: BackgroundColor = .black
}

var hexagon = Polygon(sides: [1, 2, 3, 3, 2, 1])
hexagon.backgroundColor = .shadow
print(hexagon.numberOfSides)

//: [Next](@next)
