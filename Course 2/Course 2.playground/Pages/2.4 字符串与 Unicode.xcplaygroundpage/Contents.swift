//: [Previous](@previous)
//#-hidden-code
import Foundation
//#-end-hidden-code

//: ### 2.4 Unicode

//: 回到之前的小问题：为什么同样的字符串内容，`String`和`NSString`的长度不同？为什么`String`需要使用`Index`而不使用数值作为下标？

//: 答案：为了Unicode相容性。

//: ![Unicode标量](UnicodeScalar.png)

//: 每个Unicode标量（scalar）表示一个Unicode码位（code position）/码点（code point）,需要使用至少21位二进制数字才能正确表示对应数值。UTF-8、UTF-16、UTF-32是三种Unicode的编码方案，分别以8位、16位、32位作为基本编码单元（basic code unit）进行编码；在UTF-8中，为每个Unicode标量编码需要1-4个基本编码单元；UTF-16需要1-2个；UTF-32一个编码单元对应一个标量。三种编码中只有UTF-32能够做到固定长度的内存对应一个Unicode标量，但过于浪费内存。`NSString`内部采用UTF-16编码，Swift的`String` 目前（Swift 5）内部默认采用`UTF-8`，在桥接时转变为`UTF-16`。字符串也可使用[`utf8`](https://developer.apple.com/documentation/swift/string/1539703-utf8)、[`utf16`](https://developer.apple.com/documentation/swift/string/1541301-utf16)、 [`unicodeScalars`](https://developer.apple.com/documentation/swift/string/1539070-unicodescalars)（使用21位数值作为基本编码单元，与UTF-32等价表示同一Unicode标量）表示该字符串在对应编码下表示的形式。

//: ![UTF-8](UTF8_2x.png)
//: ![UTF-16](UTF16_2x.png)
//: ![Unicode Scalar(UTF-32)](UnicodeScalar_2x.png)

//: ![NSString](NSString.png)
let unicodeString = "\u{1F469}\u{1F3FB}\u{200D}\u{1F4BB}"
let unicodeNSString = unicodeString as NSString
print("\(unicodeNSString) \(unicodeNSString.length)") // 👩🏻‍💻 7
//: `NSString`的数值下标、长度计算是基于UTF-16编码单元的，由于上例中第一个、第二个、第四个Unicode标量超出了16位二进制数（4位十六进制数），需要使用2个UTF-16编码单元才能表示，因此总计需要7个UTF-16编码单元，长度为7。

print("\(unicodeString) \(unicodeString.count)") // 👩🏻‍💻 1
let unified = "\u{30D3} \u{E9}"
print(unified) // ビ é
let separated = "\u{30D2}\u{3099} \u{65}\u{301}"
print(separated) // ビ é
print(unified == separated) // true
for scalar in unicodeString.unicodeScalars {
    print(scalar, scalar.properties.name!)
}
//: 在Unicode中还存在多个Unicode标量表示一个字符，或多种不同的标量等价表示同一字符的情况。查Unicode字符表可知，「 ゙」（`\u{3099}`）的意义为「COMBINING KATAKANA-HIRAGANA VOICED SOUND MARK」，也就是与前一个假名组合使用表示浊音的标记，在上例中与「ヒ」（`\u{30D2}`）组合后与「ビ」(`\u{30D3}`)应当同样表示相同意义的一个字符。同理「 ́」（`\u{301}`）与前一个字母组合表示尖音，因此与「e」（`\u{65}`）组合后与「é」（`\u{E9}`）等价。在emoji中，组合的情况十分普遍，比如上例中的东亚女程序员emoji字符是由四个Unicode标量组成的，分别表示女性、东亚人种修饰符、不表义的零宽连字符、计算机。

//: 综上所述，在Unicode中一个字符可以由多个Unicode标量组成，一个Unicode标量所需要的基本编码单元数量又是不一定的。Swift对Unicode的这两项特性做了完整的兼容，这也导致了Swift中每个字符所占用的内存不等，无法使用字符位置在O(1)时间内得到对应字符。而且仅依靠数值也无法简单使用数值表示具体的意义（表示第几个字符？还是第几个Unicode标量？或是第几个UTF-8基本单元？），因此Swift也使用[`UTF8View`](https://developer.apple.com/documentation/swift/unicode/scalar/utf8view)、[`UTF16View`](https://developer.apple.com/documentation/swift/unicode/scalar/utf16view)类型来分别表示对应编码下的表现形式，使开发者也可以使用使用数值索引访问UTF-8、UTF-16编码下对应位置的值。

//: References: [`String`文档](https://developer.apple.com/documentation/swift/string)，[Swift Language Guide字符串章节](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)，[Unicode文档](https://www.unicode.org/versions/Unicode10.0.0/ch03.pdf)

//: [Next](@next)
