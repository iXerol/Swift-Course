//: [Previous](@previous)
//#-hidden-code
import CoreGraphics
//#-end-hidden-code

//: ### 6.3 闭包进阶

//: #### 闭包作为函数返回值
//: 柯⾥化 (Currying)
func addTo(_ adder: Int) -> (Int) -> Int {
    return { num in
        return num + adder
    }
}
let adddTwo = addTo(2)
let addThree = addTo(3)
var result = adddTwo(5)
result = addThree(7)

//: #### 闭包作为函数参数
// 如果下标越界，则取闭包结果作为默认值
func safeSubscript(in array: [Int], index: Int, defaultValue: () -> Int) -> Int {
    guard 0..<array.count ~= index else {
        return defaultValue()
    }
    return array[index]
}
let arr = [-6, 7, 3, -1, 0]
//: 带标签的闭包 语法累赘
var element = safeSubscript(in: arr, index: 3, defaultValue: { Int.max })
//: 尾随闭包省略标签 语义模糊
element = safeSubscript(in: arr, index: 6){ Int.max }
//: `@autoclosure`
func simpifiedSafeSubscript(in array: [Int], index: Int, defaultValue: @autoclosure () -> Int) -> Int {
    return safeSubscript(in: array, index: index, defaultValue: defaultValue)
}
//: 通过`@autoclosure`简化语法、语义清晰
element = simpifiedSafeSubscript(in: arr, index: 10, defaultValue: Int.max)
//: 为什么使用`@autoclosure`而不直接传值？如果默认值需要经过复杂计算才能得到，直接传值必须先进行复杂计算，而当默认值没有被使用到时闭包不会执行，能够避免不必要的开销。
element = simpifiedSafeSubscript(in: arr, index: 2, defaultValue: addThree(4) * adddTwo(5))

//: #### 语义不清晰的多重尾随闭包
func gamble(onSuccess: () -> Void, onFailed: () -> Void) {
    if Bool.random() {
        onSuccess()
    } else {
        onFailed()
    }
}
// 普通尾随闭包
gamble (onSuccess: {
    print("success")
}) {
    print("failed")
}
// Swift 5.3 之后的多重尾随闭包
gamble {
    print("success")
} onFailed: {
    print("failed")
}
//: 无论省略哪一个参数标签都会导致语义不清晰。因此不建议使用前者，尽量仅在函数语义清晰时（如`UIView.animate`等）使用后者。

//: #### 捕获变量
// 函数和闭包能够捕获闭包外/函数体外部的临时变量值
var base = 0
let growBy: (Int) -> (Int) = { growth in
    base += growth
    return base
}
growBy(2)
growBy(6)
print(base)

//: #### 闭包是引用类型
let anotherGrowBy = growBy
//: `anotherGrowBy`和`growBy`指向同一个函数
anotherGrowBy(100)
anotherGrowBy(100)
//: 点击上方`growBy`函数体右边的展示图标，可以发现函数体被调用了4次，其中两次来自`anotherGrowBy`。

//: [Next](@next)
