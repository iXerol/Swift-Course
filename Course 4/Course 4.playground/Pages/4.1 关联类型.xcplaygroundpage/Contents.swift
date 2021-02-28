//: [Previous](@previous)
// #-hidden-code
import Foundation

struct Stack<Element>: CustomStringConvertible {
    private var container: [Element] = []

    var top: Element? { container.last }

    mutating func push(_ newItem: Element) {
        container.append(newItem)
        print("current items: \(container)")
    }

    mutating func pop() -> Element? {
        let last = container.popLast()
        print("current items: \(container)")
        return last
    }

    var description: String {
        "Stack<\(Element.self)>: \(container)"
    }
}

// #-end-hidden-code
// #-editable-code
//: ## 4 协议进阶
//: ### 4.1 关联类型

//: 类型、函数、方法都可以支持泛型，那协议是否也可以呢？
//: 答案是否定的，但有一个与泛型类似的特性：关联类型（assosiated types）。

//: 声明一个容器协议，容器的元素在类型中确定
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
}

//: 扩展在3.1节实现的`Stack`，使其符合`Container`协议
extension Stack: Container {
    //: 在实际类型中需要让编译器明确关联类型的具体类型，可以使用`typealias`。
    typealias Item = Element
    //: 如果可以通过协议中的其他内容推断出关联类型的实际类型，也可以不声明`typealias`。
    //: 如本例中可以通过`append(_:)`的参数类型推断出`Item`的实际类型，因此把上一句删去也不会有影响。
    mutating func append(_ item: Element) {
        push(item)
    }

    var count: Int { container.count }
}

//: `Sequence`是Swift标准库中的一个协议，数组、字符串等容器类型都符合该协议。
//: 扩展`Stack`，添加一个方法使其能够将`Sequence`中所有元素`push`进栈
extension Stack {
//    mutating func pushAll<S: Sequence>(_ items: S) {
//: 以上的写法无法通过编译，因为`Sequence`的元素与`Stack`元素类型不一定相同。
//: 因此需要添加`where`子句，确保两者元素类型相同或为子类
    mutating func pushAll<S: Sequence>(_ items: S) where S.Element == Element {
        for item in items {
            push(item)
        }
    }
}

var stack = Stack<NSObject>()
let arr = ["abc" as NSString, "miao" as NSString]
stack.pushAll(arr)
print(stack)

// #-end-editable-code

//: [Next](@next)
