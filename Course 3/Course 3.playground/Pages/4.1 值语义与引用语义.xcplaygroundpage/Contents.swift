//: [Previous](@previous)
//#-hidden-code
import Foundation
//#-end-hidden-code

//: ## 4 值类型与引用类型

//: ### 4.1 值语义与引用语义

//: 值语义的赋值会产生一次复制，对复制的副本进行修改不影响原值
var str1 = "哔哩哔哩"
var str2 = str1
str2 += "干杯"
str1
str2

//: 引用语义的赋值会对同一个实例创建新的引用，在任一引用对实例进行操作都会影响到其他引用
var nsstr1 = "哔哩哔哩" as NSMutableString
var nsstr2 = nsstr1
nsstr2.append("干杯")
nsstr1
nsstr2

//: [Next](@next)
