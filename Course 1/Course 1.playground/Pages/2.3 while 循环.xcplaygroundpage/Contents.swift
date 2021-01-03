//: [Previous](@previous)

//: ### 2.3 `while` 循环

//: `while` 循环用于在条件为真时执行循环体内代码
var index = 0
while index < 10 {
    print(index)
    index += 1
}

//: `repeat-while` 与 `while` 类似，区别在于循环体至少会执行一次
repeat {
    index += 10
} while index < 100

//: 使用 `continue` `break` 等循环控制语句来跳过当前循环体或结束循环
//: 或 `return` `throw` `fatalError` 等语句来提前退出
while true {
    index -= 10
    if index % 3 == 0 {
        continue
    }
    print(index)
    if index < 0 {
        break
    }
}

//: [Next](@next)
