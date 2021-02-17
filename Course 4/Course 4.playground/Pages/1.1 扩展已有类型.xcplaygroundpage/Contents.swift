import CoreGraphics

//: ## 1 扩展

//: ### 1.1 扩展已有类型
//: 一种常见的情况：在项目中使用系统框架定义的类型时，经常需要使用某一种类型的某一种工具方法，但这种方法系统没有提供，比如取`CGRect`的中心点。
//: 这种情况在C结构体中通常使用以该类型作为参数的全局函数，在Objective-C对象中通常使用Category来添加方法。

//: 在Swift中，使用扩展（extension）来为已有类型添加方法或计算属性，**不可添加存储属性**。
//: 类、结构体、枚举均可使用扩展。扩展的语法使用`extension`关键字，
extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}

//: 相较于C的全局函数，Swift扩展能够减少对于全局作用域的污染。相较于Objective-C的Category，Swift扩展在编译时决议而非运行时，效率更高。

//: [Next](@next)
