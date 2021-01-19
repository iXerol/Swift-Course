//: [Previous](@previous)

//: ### 1.3 继承

//: 前两章节描述的结构体与类的语法、功能非常相似。在很多情况下，二者确实都可以使用，但有些功能是类独有的，比如继承。

class Rectangle {
    var width = 10
    var height = 10

    func changeWidth(to width: Int) {
        self.width = width
    }

    func changeHeight(to height: Int) {
        self.height = height
    }
}
let rect = Rectangle()
rect.changeWidth(to: 20)
print(rect.width, rect.height)

//: 声明子类需要在类名后添加冒号与父类名
class Square: Rectangle {
//: 使用`override`关键字重写方法
    override func changeWidth(to width: Int) {
        self.width = width
        height = width
    }

    override func changeHeight(to height: Int) {
//: 使用`super`执行父类方法
        super.changeHeight(to: height)
        self.height = height
    }
}
let square = Square()
square.changeWidth(to: 20)
square.width
square.height

//: [Next](@next)
