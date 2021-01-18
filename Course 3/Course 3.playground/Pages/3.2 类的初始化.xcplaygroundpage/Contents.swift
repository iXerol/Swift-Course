//: [Previous](@previous)

//: ### 3.2 类的初始化

//: #### 默认空初始化方法
//: 如果所有存储属性都有默认值，则类也有默认的空初始化方法。
//: 如果类有存储属性没有默认值，必须显式声明初始化方法，没有默认初始化方法。
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

//: #### 初始化方法的继承与重写

//: 如果子类为所有新增的属性提供了默认值，那么在以下两种场景下，类会继承父类的初始化方法。
//: - 如果子类没有定义任何指定初始化方法，就会继承父类的指定初始化方法。
//: - 如果子类实现了父类的所有指定初始化方法，就会继承父类的所有便捷初始化方法。

//: 子类可以使用`override`关键字重写父类的初始化方法
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init()
//: 如果父类存在无参数的初始化方法，且子类的初始化方法只设置了新增属性的初始值，则会在初始化方法末尾自动调用父类的空初始化方法。
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//: #### 指定初始化方法与便捷初始化方法

class Car: Vehicle {
    var color: String
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
//: 指定初始化方法（Designated Initializer）是类最主要的初始化方法，目的是确保属性在初始化完成前都有值。
    init(color: String, wheels: Int) {
        self.color = color
        super.init()
        numberOfWheels = wheels
    }

//: 便捷初始化方法（Convenience Initializer）在初始化方法体内部调用了另一个指定初始化方法，常用于省略一些指定初始化方法的默认参数。
    convenience init(color: String) {
        self.init(color: color, wheels: 4)
    }
}
let car = Car(color: "black")
print("Car: \(car.description)")

//: #### 必须初始化方法与反初始化方法

class Person {
    var name: String

//: 必需初始化方法（Required Initializer）可以要求子类必须提供特定的初始化方法。
    required init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var grade: String
    init(name: String, grade: String) {
        self.grade = grade
        super.init(name: name)
    }

//: 不声明此方法则会在编译时报错
    required init(name: String) {
        self.grade = "无"
        super.init(name: name)
    }

    var description: String {
        return "\(grade)学生\(name)"
    }

//: 反初始化是初始化的反面，即类被销毁时调用的方法，使用`deinit`声明
    deinit {
        print("\(self.description)离开了学校")
    }
}
var studentsInSchool = [Student(name: "张三", grade: "高中三年级"), Student(name: "李四", grade: "高中二年级")]
studentsInSchool.removeAll()

//: [Next](@next)
