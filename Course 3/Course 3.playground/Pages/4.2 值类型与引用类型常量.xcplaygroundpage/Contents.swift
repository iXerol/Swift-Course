//: [Previous](@previous)

//: ### 4.2 值类型与引用类型常量
//: 在Swift中，类与闭包为引用类型，其他类型均为值类型。

//: 可以混合使用值类型与引用类型。
//: 比如在类中使用值类型属性，在结构体中使用引用类型属性。
class ReferenceInt {
    var value: Int = 1
}

struct IntWrapper {
    var value: ReferenceInt
}

//: `let`声明的引用类型常量，也可以改变内部的值。不能改变的是引用的实例，实例内部可以改变。
let refInt = ReferenceInt()
refInt.value = 10

//: `let`声明的值类型常量，不可以改变内部的值，即使内部是使用`var`声明的变量，因为值类型是一个整体，整体不可变则任何一部分都不可以改变。
let wrapper = IntWrapper(value: refInt)
//wrapper.value = ReferenceInt()

//: 值类型常量内部引用的实例依然可以改变，因为其不处于结构体内部。
wrapper.value.value = 5


//: [Next](@next)
