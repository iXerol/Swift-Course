//: [Previous](@previous)

//: ### 2.2 访问与修改字符串

//： 使用 `var` 声明可变字符串，`let` 声明的字符串不可修改
let constString = "Swift Course"
var variableString = "Swift Course"

//: 使用 `+=` 运算符或 `append(_:)` 方法在尾部添加字符
variableString += " is great"
variableString.append("!")
print(variableString)
// constString += " is great"

//: 使用 `removeLast(_:)` `removeLast()` 去除结尾字符
variableString.removeLast()
variableString.removeLast(9)
print(variableString)

variableString = "123456789"
//: 使用 `removeFirst(_:)` `removeFirst()` 去除开头字符
variableString.removeFirst()
variableString.removeFirst(3)
print(variableString)

//: 使用索引`Index`作为下标表示位置
var start = variableString.startIndex
var end = variableString.endIndex
var index = variableString.index(end, offsetBy: -3)
print(variableString[start], variableString[index], variableString[start...index])
//: 在下标位置插入、删除字符
variableString.insert("哔", at: index)
variableString.remove(at: start)
print(variableString)

//: #### 小问题：为什么`String``需要使用`Index`而不使用数值作为下标？

//: 使用下标取子字符串`Substring`
start = variableString.startIndex
end = variableString.endIndex
index = variableString.index(end, offsetBy: -3)
let substr = variableString[start...index]
print(substr)
//: 由于`String`是值类型，因此新字符串需要新的内存空间，但`Substring`是原字符串的一部分，只包含了对原字符串的索引位置，其余方法都是依据原字符串进行计算，不需要额外空间存储
print(substr.base, substr.count)

//: [Next](@next)
