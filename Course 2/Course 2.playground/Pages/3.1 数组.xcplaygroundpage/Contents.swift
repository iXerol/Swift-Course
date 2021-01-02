//: [Previous](@previous)

//: ## 3 数组

//: 使用数组把同类的值放在同一个容器内，数组的元素可为任何类型。

//: ### 3.1 数组声明

//: 数组类型`Array<T>`与`[T]`等价。
//: 以下四种方式均可以声明`String`类型的空数组，推荐使用第四种语法。
var arr1 = Array<String>()
var arr2 = [String]()
var arr3 = [] as Array<String>
var arr4: [String] = []

//: #### 填充数组
//: 字面量方式填充数组内容、以多个同一元素填充、以另一数组填充
arr1 = ["a", "b"]
arr2 = Array(repeating: "a", count: 63)
arr3 = Array(arr1)
arr4 = [String](arr3)

//: 使用`count`获取元素个数，`isEmpty`判断是否为空数组，`capacity`获取当前数组在不扩大的情况下的最大容量
arr2.count
arr2.isEmpty
arr2.capacity

//: [Next](@next)
