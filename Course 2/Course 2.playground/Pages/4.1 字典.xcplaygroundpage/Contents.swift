//: [Previous](@previous)

//: ## 4 字典

//: 使用字典无序存放键值对（key-value pair），key 必须**可散列（hashable）**，value可为任何类型。

//: ### 4.1 创建字典

//: `[Key: Value]`与`Dictionary<Key, Value>`等价
//: 与数组类似，key为`Int` value为`String`的空字典的创建方式也有以下几类
var dict1 = [Int: String]()
var dict2 = Dictionary<Int, String>()
let dict3 = [:] as Dictionary<Int, String>
let dict4: [Int: String] = [:]

//: #### 填充字典
//: 字面量方式填充字典内容
dict1 = [2: "22", 3: "33", 2233: "小电视"]
dict2 = [22: "22",
         33: "33",
         2233: "bilibili"]

//: 使用`count`获取元素个数，`isEmpty`判断是否为空数组，`capacity`获取当前数组在不扩大的情况下的最大容量
dict1.count
dict1.isEmpty
dict1.capacity

//: [Next](@next)
