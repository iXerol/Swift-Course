//: [Previous](@previous)

//: ### 2.5 访问控制

//: 前几个章节声明的属性/方法中，有一些并不希望对外部可见、可在外部被修改。
//: Swift通过访问控制来限制一些细粒度的访问权限。
//: Swift 的访问控制基于module、作用域（当前结构体、类等）、文件。

//: 目前共有五个访问层级：
//: - `open`：当前module、引入了当前module的文件可见。 当前module、引入了当前module的文件可继承/重写。
//: - `public`：当前module、引入了当前module的文件可见。   当前module可继承/重写。
//: - `internal`（默认）：当前module可见。    当前module可继承/重写。
//: - `private`：当前作用域可见。  当前作用域可继承。
//: - `fileprivate`：当前文件可见。  当前文件可继承/重写。

public class Rectangle {
    public fileprivate(set) var width = 10

    public fileprivate(set) var height = 10

    public func changeWidth(to width: Int) {
        self.width = width
    }

    public func changeHeight(to height: Int) {
        self.height = height
    }

    private func printInfo() {
        print("width: \(width), height: \(height)")
    }
}

let rect = Rectangle()
rect.changeWidth(to: 20)
rect.width
rect.height

public class Square: Rectangle {
    internal var sideLength: Int { width }

    override public func changeWidth(to width: Int) {
        self.width = width
        height = width
    }

    override public func changeHeight(to height: Int) {
        super.changeHeight(to: height)
        self.height = height
        // 无法访问父类的`private`方法
//        printInfo()
    }
}

let square = Square()
square.changeWidth(to: 20)
square.width
square.height

//: [Next](@next)
