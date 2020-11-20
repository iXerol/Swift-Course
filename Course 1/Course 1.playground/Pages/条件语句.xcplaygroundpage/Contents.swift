//: [Previous](@previous)

var number = 42
//: Swift 的 `if` 判断条件不需要加括号，但执行的语句即使只有一行也必须加花括号
if number > 0 {
    print("\(number) 是正数")
} else if number == 0 {
    print("0")
} else {
    print("\(number) 是负数")
}

//: 条件必须为 `Bool` 类型，使用其他类型作为条件会产生编译错误
// if number { }

/*:
 使用比较运算符得到 `Bool` 类型数值

 数学比较运算符有 `< > <= >= == !=`

 其他比较运算符还有 `=== !== ~=` 等，之后会介绍
 */

// 逻辑运算符 && || ! 对 `Bool` 类型值进行变换/组合
let x = Int.random(in: -10 ... 10)
let y = Int.random(in: -10 ... 10)
if x > 0 && y > 0 {
    print("(\(x), \(y)) 在第一象限")
}
if !(x == 0 || y == 0) {
    print("(\(x), \(y)) 不在坐标轴上")
}

//： 三目运算符 `? :`
let message = number >= 0 ? "自然数" : "非自然数"

//: [Next](@next)
