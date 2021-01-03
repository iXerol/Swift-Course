//: [Previous](@previous)

//: ### 1.2 类型推断与注解

//: #### 类型注解 (type annotation)
var intNumber = 42
let floatNumber: Float = 42
let doubleNumber: Double = 42
let uint8Number: UInt8 = 42

//: #### 类型推断 (type inference)

let doubleSum = 42 + 42.0
let 类型 = type(of: intNumber)
var 内存 = MemoryLayout.size(ofValue: intNumber)
内存 = MemoryLayout<Int>.size

//: [Next](@next)
