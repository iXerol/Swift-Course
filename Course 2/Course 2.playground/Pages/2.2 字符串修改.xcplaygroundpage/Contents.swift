//: [Previous](@previous)

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
let start = variableString.startIndex
let end = variableString.endIndex
let index = variableString.index(end, offsetBy: -3)
print(variableString[start], variableString[index], variableString[start...index])
//: 在下标位置插入、删除字符
variableString.insert("哔", at: index)
variableString.remove(at: start)
print(variableString)

//: #### 小问题：为什么`String``需要使用`Index`而不使用数值作为下标？

//: [Next](@next)
