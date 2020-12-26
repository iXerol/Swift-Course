//: [Previous](@previous)

//: ### 2.3 字符串遍历

let str = "ビリビリ (゜-゜)つロ 乾杯~-🍻"

//: 使用`for-in`循环遍历字符
print(str.count)
for character in str {
    print(character, MemoryLayout.size(ofValue: character))
}

//: 遍历 Unicode 标量
print(str.unicodeScalars.count)
for unicodeScalar in str.unicodeScalars {
    print(unicodeScalar, MemoryLayout.size(ofValue: unicodeScalar))
}

//: 遍历 UTF-8、UTF-16 编码数据
print(str.utf16.count)
for code in str.utf16 {
    print(UnicodeScalar(code) ?? "/", MemoryLayout.size(ofValue: code))
}

print(str.utf8.count)
for code in str.utf8 {
    print(UnicodeScalar(code), MemoryLayout.size(ofValue: code))
}

//: [Next](@next)
