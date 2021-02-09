//: [Previous](@previous)

//: ### 1.3 协议继承

//: Swift的协议也支持继承，可以在父协议的基础上添加子协议的额外要求。

protocol Exponential: Numeric {
    func powered(by rhs: Self) -> Self
}

//: [Next](@next)
