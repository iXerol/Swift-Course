//: [Previous](@previous)
//#-hidden-code
import CoreFoundation
//#-end-hidden-code

//#-editable-code
//: ## 5 内存管理

//: ### 5.1 内存管理与引用计数

//: 临时的值类型常量、变量存放在栈内存，在离开当前作用域后就会释放。即使是Swift内建的写时复制机制（内部实现类似引用类型）的值类型，也会在不被引用后自动释放，开发者不需要担心值类型引起内存泄漏。
//: 引用类型存放在堆内存，依据引用计数（Reference Count）来管理。只要引用计数大于0，实例就会存活。一旦引用计数变成0，实例就会被回收，`deinit`方法运行。Swift的引用计数完全基于自动引用计数（Automatic Reference Count, ARC），编译器会自动在合适的位置添加`retain`（增加引用计数）与`release`（减少引用计数）调用。

class C {
    deinit {
        print("引用计数为 0，内存已释放")
    }
}
//: `CFGetRetainCount(_:)`可以获取引用计数的值，但由于函数传参会增加一次引用，会导致取到的引用计数比实际多1
//: `isKnownUniquelyReferenced(_:)`可以得知变量是否为实例的唯一引用
var c1: C? = C()
print(CFGetRetainCount(c1))
print(isKnownUniquelyReferenced(&c1))
var c2 = c1
print(CFGetRetainCount(c1))
print(isKnownUniquelyReferenced(&c1))
c2 = nil
print(CFGetRetainCount(c1))
print(isKnownUniquelyReferenced(&c1))
c1 = nil
//print(CFGetRetainCount(c1))
print(isKnownUniquelyReferenced(&c1))
print("end")
//#-end-editable-code

//: [Next](@next)
