//: [Previous](@previous)

import SwiftUI
//: ### 4.5 不透明类型

//: 4.1节提到，「拥有关联类型的协议不能作为类型声明使用，只能作为类型约束使用」。
//: 但我们在使用`SwiftUI`的`View`协议的时候会发现并不完全是这样。

//: `View`协议拥有关联类型`Body`和`Body`类型的属性`body`，但我们一般不会这样声明一个`View`：
struct TextView: View {
    typealias Body = Text
    var body: Text {
        Text("Swift")
    }
}
//: 而是像这样：
struct MyView: View {
    var body: some View {
        Text("Swift")
    }
}

//: 因为对于`SwiftUI`的渲染系统而言，并不关心`body`实际是什么类型，拥有什么类型的特性，只需要是符合`View`协议的实例即可。
//: 这种不向外暴露实际类型，只根据其符合的协议来描述返回值的特性被称为不透明类型（Opaque Type），语法是在返回值的协议类型前加`some`。

//: 不透明类型只能作为返回值的声明，而不能在变量声明、参数声明时使用。
//: 因为不透明类型在编译时需要确定具体的类型，而且需要确保类型一致性。
//: 除了对于关联类型协议的支持之外，不透明类型和协议类型作为返回值的一大区别就在于类型一致性。
func getProtocolString(_ item: String) -> CustomStringConvertible {
    if item.count < 5 {
        return item
    } else {
        return item.prefix(5)
    }
}

func getOpaqueString(_ item: String) -> some CustomStringConvertible {
    if item.count < 5 {
        return item // String
    } else {
        return item.prefix(5) // Substring
    }
}
//: 以上函数无法通过编译，因为不透明类型的返回类型不一致。


//: [Next](@next)
