//: [Previous](@previous)

//: ### 2.3 属性观察

class Player {
//: 可以为可变存储属性设置两个属性观察者：`willSet`与`didSet`，分别会在属性被设置前后调用。
//: `willSet`与`didSet`均为以该属性类型作为参数，无返回值的闭包。
    var rate = 1.0 {
//: 在`willSet`后的圆括号内声明新变量名（本次赋值的新值），可在闭包内使用。不声明则默认名为`newValue`。
        willSet(newRate) {
            print("rate will change from \(rate) to \(newRate)")
        }
//: 在`didSet`后的圆括号内声明旧变量名（赋值前的旧值），可在闭包内使用。不声明则默认名为`oldValue`。
        didSet(oldRate) {
            print("rate did change from \(oldRate) to \(rate)")
        }
    }
}

let player = Player()
print("has not set rate")
player.rate = 0
print("has set rate")

//: [Next](@next)
