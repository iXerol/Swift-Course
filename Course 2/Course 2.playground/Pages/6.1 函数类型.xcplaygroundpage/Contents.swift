//: [Previous](@previous)

//: ## 6 闭包

//: ### 6.1 函数类型

func myMax(_ a: Int, _ b: Int) -> Int {
    return a > b ? a : b
}

func emptyFunc() {}

//: 函数也是一种数据类型
let maxFunc = myMax
print(type(of: maxFunc))
// (Int, Int) -> Int

print(type(of: emptyFunc))
// () -> ()

//: 函数类型也能作为函数参数
let dict1 = ["a": 1, "b": 2, "c": 3]
let dict2 = ["a": 3, "b": 2, "c": 1]
let mergedDict = dict1.merging(dict2, uniquingKeysWith: myMax)
print(mergedDict)

//: `merging(_:uniquingKeysWith:)`方法中的第二个参数其实是一个闭包
//: 闭包是匿名的函数，相当于Objective-C中的block

//: [Next](@next)
