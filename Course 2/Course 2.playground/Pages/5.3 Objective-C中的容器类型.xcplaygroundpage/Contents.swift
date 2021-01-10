//: [Previous](@previous)

import Foundation

//: [`String`与`NSString`](https://developer.apple.com/documentation/swift/string#2919514)，[`Array`与`NSArray`](https://developer.apple.com/documentation/swift/array#2846730)，[`Dictionary`与`NSDictionary`](https://developer.apple.com/documentation/swift/dictionary#2846239)，[`Set`与`NSSet`](https://developer.apple.com/documentation/swift/set#2845530)均可使用`as`运算符自动进行桥接。
//: 使用这些类型在Swift/Objective-C暴露的API，在Objective-C/Swift中会被自动转变为对应的桥接类型。
let str = "Swift Course"
let nsStr = str as NSString
//: 如果`Array`、`Dictionary`、`Set`容器内均为Objective-C可不经转换直接访问的对象或协议，则桥接需要的时间为O(1)，否则需要O(n)的时间。`String`的桥接则一定至少需要O(n)的时间。

//: [Next](@next)
