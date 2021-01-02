//: [Previous](@previous)

//: ### 2.5 字符串常用方法

//: `isEmpty` 判空
var str = ""
print(str.isEmpty)
str.append("0")
print(str.isEmpty)

//: `contains(+:) 包含字符`
str = "bilibili"
print(str.contains("b"), str.contains("a"))

//: `hasPrefix(_:)` `hasSuffix(_:)` 包含前缀字符串、后缀字符串
print(str.hasPrefix("bili"), str.hasPrefix("ili"))
print(str.hasSuffix("bili"), str.hasSuffix("bi"))

//: `lowercased()` `uppercased()` 转换为小写/大写
print(str.uppercased(), str.uppercased().lowercased())

//: `split(separator:maxSplits:omittingEmptySubsequences:)` 将字符串按照分隔符分割成数组
print(str.split(separator: "i"))

//: `prefix(_:)` `suffix(_:)` 获取前缀/后缀（返回子字符串）
print(str.prefix(3), str.suffix(2))

//: `dropFirst(_:)` `dropLast(_:)` 获取除前缀/后缀外的部分（返回子字符串）
print(str.dropFirst(3), str.dropLast(2))

//: [Next](@next)
