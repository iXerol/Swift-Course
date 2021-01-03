//: [Previous](@previous)

//: ## 5 集合

//: 使用集合无序存放互不相同的值，元素必须**可散列（hashable）**。

//: ### 5.1 创建集合
//: 集合类型的字面量表示方式与数组一致，因此必须显式声明为`Set`类型。
var set1 = Set<String>()
var set2: Set<String> = []
let set3: Set = ["element", "element"]

//: 使用`count`获取元素个数，`isEmpty`判断是否为空数组，`capacity`获取当前数组在不扩大的情况下的最大容量
set3.count
set3.isEmpty
set3.capacity

//: [Next](@next)
