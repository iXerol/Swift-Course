//: [Previous](@previous)

let netError = (404, "not found")
let (statusCode, message) = netError
print("this statusCode is \(statusCode)")
print("this message is \(message)")

print("this statusCode is \(netError.0)")
print("this message is \(netError.1)")

//: [Next](@next)
