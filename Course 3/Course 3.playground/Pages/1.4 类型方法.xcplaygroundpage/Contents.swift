//: [Previous](@previous)

//: ### 1.4 类型方法

//: 前几章节所述方法都是实例方法，需要对具体结构体/类的实例使用。
//: 但有些方法，对该结构体/类的所有实例都适用，这时可以将其声明为该类型的方法。

struct Rectangle {
//: 使用`static`关键字声明结构体的类型方法
    static func numberOfSides() -> Int {
        return 4
    }
}

class Bird {
//: 使用`class`关键字或`static`关键字声明类的类型方法
    class func canFly() -> Bool {
        return true
    }

    static func numberOfLegs() -> Int {
        return 2
    }
}

class Ostrich: Bird {
//: 使用`class`关键字声明的类的类型方法可重写
    override class func canFly() -> Bool {
        return false
    }

//: 使用`static`关键字声明的类型方法**不**可重写
//    override static func numberOfLegs() -> Int {
//        return 2
//    }
}

//: [Next](@next)
