//: [Previous](@previous)

let numbers = [22, 33, 2233]
let strings = numbers.map { String($0) }
print(strings)
let smallNumbers = numbers.filter { $0 < 100 }
print(smallNumbers)
let sum = numbers.reduce(0, +)
print(sum)

//: [Next](@next)
