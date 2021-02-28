//: [Previous](@previous)

//: ### 3.3 类型约束

//: 对所有数值类型添加求和方法
func sum<T>(of items: T...) -> T {
    return items.reduce(.zero, +)
}

//: 以上代码无法通过编译，因为以上方法对所有类型都生效，但并不是所有类型都能能使用加法。
//: 因此把能作为函数参数的类型，限定在符合`AdditiveArithmetic`的范围内。

//: 类型约束的语法是在占位类型后添加类或协议。
//: 如果是类，则实际类型必须是该类或其子类；如果是协议或协议组合，则实际类型必须符合该协议或协议组合。
func sum<T: AdditiveArithmetic>(of items: T...) -> T {
    return items.reduce(.zero, +)
}

sum(of: 1, 2, 4)
sum(of: 0.1, 2.2, 3.3)

//: [Next](@next)
