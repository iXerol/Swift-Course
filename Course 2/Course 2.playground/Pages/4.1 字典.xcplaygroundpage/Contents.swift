//: [Previous](@previous)

//: ## 4 字典

//: 使用字典无序存放键值对（key-value pair），key 必须**可散列（hashable）**，value可为任何类型。

//: ### 4.1 字典声明

//: `[Key: Value]`与`Dictionary<Key, Value>`等价
//: 与数组类似，key为`Int` value为`String`的空字典的声明方式也有以下几类
var dict1 = [Int: String]()
var dict2 = Dictionary<Int, String>()
var dict3 = [:] as Dictionary<Int, String>
var dict4: [Int: String] = [:]

//: #### 填充字典
//: 字面量方式填充字典内容
dict1 = [2: "22", 3: "33", 2233: "小电视"]
dict2 = [22: "22",
         33: "33",
         2233: "bilibili"]

//: [Next](@next)
