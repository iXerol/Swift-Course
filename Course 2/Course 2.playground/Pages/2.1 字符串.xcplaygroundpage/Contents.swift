//: [Previous](@previous)
//#-hidden-code
import Foundation
//#-end-hidden-code
//: ## 2 字符串

//: ### 2.1 字符串基本语法

//: 转义字符 `\`
let singleLineString = "大家好这里是\"MTC技术精品课\"之Swift课程"
print(singleLineString)

//: 使用 `"""` 声明跨行字符串

//: 对于跨行字符串中少于三个的引号不需要转义

//: 在行尾使用 `\`，在字符串内不会换行
let multiLineString = """
    同学们:
        大家好，这里是"MTC技术精品课\"\
    之\"""Swift课程""\"
    欢迎大家
        此致\
    敬礼
    """
print(multiLineString)

//: 特殊字符的表示方式与其他语言基本一致

//: `\0`空字符，`\\`反斜杠，`\t`制表符，`\n`换行，`\r`回车，`\"`双引号，`\'`单引号
let specialString = "a\0b\\c\td\ne\rf\"g\'h"
print(specialString)
//: 在字符串前后加上`#`可以避免转义，而且可以加多个避免字符串中出现`#`的情况
let notSpecialString = #"a\0b\\c\td\n#e\rf\"g\'h"#
print(notSpecialString)

//: `\u{n}` ，*n* 为1~8位十六进制数，表示相应码位的 Unicode 标量
let unicodeString = "\u{1F469}\u{1F3FB}\u{200D}\u{1F4BB}"
print("\(unicodeString) \(unicodeString.count)") // 👩🏻‍💻 1
let unicodeNSString = unicodeString as NSString
print("\(unicodeNSString) \(unicodeNSString.length)") // 👩🏻‍💻 7
//: #### 小问题：输入了四个 Unicode 码位，为什么 `String` 字符串长度为 1，`NSString` 字符串长度为 7？

//: [Next](@next)
