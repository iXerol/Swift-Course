//: [Previous](@previous)
//: ### 1.1 常量与变量

//: #### 使用`let`声明常量，使用`var`声明变量
//: 声明变量未赋值时调用会产生编译错误
var myVariable = 42
myVariable = 114514
let myConstant = 42
// myConstant = 50

// anotherVariable = 1.0
var anotherVariable: Double
anotherVariable = 5.3
anotherVariable = 6.0
// var anotherVariable = 1.0

let anotherConstant: String
// print(anotherConstant)
anotherConstant = "Hello, world!"
// anotherConstant = "你好"
let stringLength = anotherConstant.count

//: 在命名规则内，可使用*几乎所有*有效Unicode字符作为常量/变量名
let π = 3.1415926
let 你好 = "哔哩哔哩 (゜-゜)つロ 干杯~"
let 🐶 = "dog"
print("\(π) \(你好) \(🐶)")

//: - 规则一：**保留关键字不可用**，必须使用时需在两端加上**反引号**
// let default = "default"
let `default` = "default"
//: - 规则二：**空白字符**、**各类符号**（除下划线）不可用
// let a←p p+l┌e = "apple"
let a_p_p_l_e = "apple"
//: - 规则三：不可以**数字开头**
// let 12_Pro_Max = "iPhone 12 Pro Max"
let iPhone_12_Pro_Max = 8499

//: [Next](@next)
