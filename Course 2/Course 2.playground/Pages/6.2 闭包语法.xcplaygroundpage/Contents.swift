//: [Previous](@previous)
//#-hidden-code
import UIKit
import SwiftUI
import PlaygroundSupport
//#-end-hidden-code

//#-editable-code
var arr = [2233, 22, 33, 12345, 0, -22, -33]

//: ### 6.2 闭包语法

arr.sort(by: { (a: Int, b: Int) -> Bool in
    return a < b
})
print(arr)

//: 简化至一行内
arr.sort(by: { (a: Int, b: Int) -> Bool in return a < b })

//: 闭包内只有一句表达式时可以省略`return`
arr.sort(by: { (a: Int, b: Int) -> Bool in a < b })

//: 由于编译器可推断出闭包返回值，因此可以省略返回值类型声明
arr.sort(by: { (a: Int, b: Int) in a < b })

//: 由于编译器可推断出闭包参数类型，因此可以省略参数类型声明
arr.sort(by: { (a, b) in a < b })

//: 可以省略参数名，可使用`$0` `$1`等代指第n个参数，此时 `in` 也被省略
arr.sort(by: { $0 < $1 })

//: 尾随闭包（trailing closure）语法，最后一个参数如果是闭包可省略参数标签，直接将闭包跟随在函数之后
arr.sort { $0 < $1 }

//: 多重尾随闭包（from Swift 5.3）
UIView.animate(withDuration: 1) {
    // animate
} completion: { (complete) in
    // completion
}

let view = Button {
    // action
} label: {
    // label
    Circle()
}.onLongPressGesture { pressing in
    // pressing
} perform: {
    // perform
}
//#-end-editable-code

//: [Next](@next)
