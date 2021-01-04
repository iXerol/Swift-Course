//: [Previous](@previous)
//: ### 1.3 类型检查与转换

//: #### 类型检查 (type checking)
var intNumber = 42
let floatNumber: Float = 42
// intNumber = floatNumber
// _ = intNumber + floatNumber

//: #### 类型转换 (type casting)
//: 非相同类型无法直接计算 需要转换为相同类型。
//: `SomeType(ofInitialValue)`
let first = 3
let second = 0.1415926
//let pi = first + second
let pi = Double(first) + second

//: 或通过`as`运算符进行编译器能够确定可行的类型转换
var third = 3 as Double
_ = third + second

//: [Next](@next)
