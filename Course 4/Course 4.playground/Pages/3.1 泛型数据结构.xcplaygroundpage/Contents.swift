//: [Previous](@previous)

//: ## 3 泛型
//: 与大部分现代编程语言一样，Swift也提供「泛型」功能，在其他语言也称为「模版」或「参数多态」。
//: 通过泛型可以编写对多种类型都适用的代码，提高代码复用率；而且对于强类型语言来说，能够加强类型安全，减少类型转换次数。

//: ### 3.1 泛型数据结构
//: 我们已经接触过的可空类型以及数组、字典等容器类型，都是使用了泛型的数据结构，在使用时才真正确定其类型。

//: 接下来实现一个泛型栈数据结构。

//: 使用尖括号标记名为`Element`的占位类型，可以任意命名，在内部任何一个需要使用具体类型的地方使用。
//: 如果有多个占位类型，则在尖括号内使用逗号隔开，如`<T, U>`。
struct Stack<Element> {
    private var container: [Element] = []

    var top: Element? { container.last }

    mutating func push(_ newItem: Element) {
        container.append(newItem)
        print("current items: \(container)")
    }

    @discardableResult
    mutating func pop() -> Element? {
        let last = container.popLast()
        print("current items: \(container)")
        return last
    }
}

//: `Element`的实际类型为`Int`的`Stack`，编译器使用实际类型替换占位类型的过程叫做特化
var stack = Stack<Int>()
stack.top
stack.push(22)
stack.push(33)
stack.top
stack.pop()
stack.top


//: [Next](@next)
