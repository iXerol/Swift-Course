//: [Previous](@previous)

//: 类型注解 (type annotation)
var intNumber = 42
let floatNumber: Float = 42
let doubleNumber: Double = 42

//: 类型推断 (type inference)
let 类型 = type(of: intNumber)
var 内存 = MemoryLayout.size(ofValue: intNumber)
内存 = MemoryLayout<Int>.size

//: 类型检查 (type checking)
// intNumber = floatNumber
// intNumber + floatNumber

//: [Next](@next)
