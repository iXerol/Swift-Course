//: [Previous](@previous)

//: ### 5.2 循环引用与`weak`

//: 采用引用计数来管理内存一定会遇到一个问题：循环引用导致的内存泄漏
class A {
//    var b: B?
    weak var b: B?

    deinit {
        print("A released")
    }
}

class B {
    var a: A?

    deinit {
        print("B released")
    }
}

var a: A? = A()
var b: B? = B()
a?.b = b
b?.a = a
a = nil
b = nil

//: 虽然我们把a和b都释放了，但a和b内部互相引用了对方，导致引用计数不会归零，因此不会释放。把上方代码的注释打开，替换掉前一行，就会发现A和B的`deinit`方法都执行了。原本的代码中`A`的属性`b`是强引用（strong reference），修改之后变成了弱引用（weak reference）。

//: 使用`weak`声明弱引用对象，不会增加引用计数，且会在指向的实例被释放时自动变为`nil`。
//: 弱引用对象必须使用`var`声明，且必须为可空类型。这两个条件都是因为弱引用在实例被释放时会变为`nil`。
//: [Next](@next)
