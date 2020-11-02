//: [Previous](@previous)

//: 使用元组组合多个元素，元素可以为不同类型
let netError = (404, "not found")

//: 使用数字编号访问元组内的元素
print("this statusCode is \(netError.0)")
print("this message is \(netError.1)")

//: 为元组内元素命名
let (statusCode, message) = netError
print("this statusCode is \(statusCode)")
print("this message is \(message)")

//: [Next](@next)
