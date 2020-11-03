//: [Previous](@previous)

//: 嵌套函数：函数内可声明子函数
func myMax(_ a: Int, _ b: Int, _ c: Int) -> Int {
    func myMax(_ a: Int, _ b: Int) -> Int {
        return a > b ? a : b
    }
    return myMax(myMax(a, b), c)
}
print(myMax(1, 2, 0))
//: 函数体内定义的内容仅在函数体内可见，也就是作用域在函数体内
// print(myMax(1, 2))

//: `in-out` 参数
//: 被标记为 `inout` 的参数能让函数影响到函数体以外的`变量`
func mySwap(_ a: inout Int, _ b: inout Int) {
    let c = a
    a = b
    b = c
}
var num1 = 10, num2 = 0
//: 向 `in-out` 参数传参时需要加上 `&` 前缀，与 C 的取址符一致
//: 与 C/C++ 中的指针/引用参数不同的是，`in-out` 是在函数起始时复制了一份参数，在结束时重新赋值给原变量，因此无论在函数体内部对参数进行了几次修改，实际上外部参数只会修改一次。
mySwap(&num1, &num2)
print("\(num1) \(num2)")
//: `inout` 参数必须使用 `var` 声明，不能有默认值

//: 函数类型
//: 函数也是一种数据类型
let maxFunc = myMax
print(type(of: maxFunc))

func printGreeting1() {
    print("Hello, playground.")
}
print(type(of: printGreeting1))

//: `()` 是空元组，`Void` 是 `()` 的 `typealias`
//: 因此以下两种函数的写法与以上函数等价
func printGreeting2() -> () {
    print("Hello, playground.")
}

func printGreeting3() -> Void {
    print("Hello, playground.")
}

//: [Next](@next)
