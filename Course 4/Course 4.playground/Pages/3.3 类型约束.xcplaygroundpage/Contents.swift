//: [Previous](@previous)

//: ### 3.3 类型约束

//: 对所有数值类型添加求和方法
func sum<T>(of items: T...) -> T {
    return items.reduce(.zero, +)
}

//: 以上代码无法通过编译，因为以上方法对所有类型都生效，但并不是所有类型都能能使用加法。
//: 因此把能作为函数参数的类型，限定在符合`AdditiveArithmetic`的范围内。

//: 泛型函数/方法类型约束的语法是在占位类型后添加类或协议。
//: 如果是类，则实际类型必须是该类或其子类；如果是协议或协议组合，则实际类型必须符合该协议或协议组合。
func sum<T: AdditiveArithmetic>(of items: T...) -> T {
    return items.reduce(.zero, +)
}

sum(of: 1, 2, 4)
sum(of: 0.1, 2.2, 3.3)

//: 也可以为扩展添加类型约束，比如为3.1节实现的`Stack`添加合并栈顶两元素为两元素之和的方法。
//: 这需要元素类型满足`AdditiveArithmetic`，即为可相加的数值类型。使用`where`子句添加元素类型的约束。
extension Stack where Element: AdditiveArithmetic {
    mutating func mergeTopTwo() {
        guard let top1 = self.pop() else {
            return
        }
        guard let top2 = self.pop() else {
            self.push(top1)
            return
        }
        self.push(top1 + top2)
    }
}
var intStack = Stack<Int>([1, 2, 3])
intStack.mergeTopTwo()
var stringStack = Stack<String>(["1", "2", "3"])
stringStack.mergeTopTwo()
//: 同样都是`Stack`的实例，元素为`Int` `Double`等可相加数值类型可以正常调用该扩展中的方法；但元素为`String`等其他类型就会产生编译错误，不可使用这些方法。

//: [Next](@next)
