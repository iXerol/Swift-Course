//: [Previous](@previous)

//: ### 4.6 常用协议
//: `Equatable`,`Hashable`, `Codable`, `Comparable` 是很常用的Swift标准库中的协议。
//: 分别表示可判等、可哈希、可编解码（由编码协议`Encodable`与解码协议`Decodable`组合成）与可比大小。

//: 其中前三者只要结构体/类的所有属性均满足该协议，即可自动生成对全属性进行判等、哈希、编解码的协议要求方法。
//: 对于枚举，只要拥有满足协议的原始值即可自动生成协议要求的方法。
struct User: Equatable, Hashable, Codable {
    /// 用户ID
    let mid: String
    /// 入站时间戳
    let jointime: Int
    /// 用户名
    var name: String
    /// 头像图片地址
    var face: String

//: 虽然会自动生成，但当然可以重写。比如用户判等只需要判断`mid`，因为当用户修改名字、头像后其他属性可能不等，默认判等方法不满足要求。
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.mid == rhs.mid
    }
}

//: `Comparable`继承自`Equatable`。满足该协议需要自己实现`<`运算符，配合`Equatable`要求的`==`运算符，即可自动生成`>`, `<=`, `>=`等其他运算符。
extension User: Comparable {
    /// 注册时间更早的用户更大
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.jointime > rhs.jointime
    }
}

//: 开发者可以符合`CustomStringConvertible`，在打印的时候可以自定义需要的信息。
//: `CustomDebugStringConvertible`通常用于开发者希望在debug或部分时机打印更详细的信息，需要使用`debugPrint`方法打印。
extension User: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return "\(name), mid=\(mid)"
    }
    public var debugDescription: String {
        return "\(name), mid=\(mid), jointime=\(jointime), avatar=\(face)"
    }
}
let user = User(mid: "2233", jointime: 22223333, name: "bilibili", face: "bilibili.png")
print(user)
debugPrint(user)
//: `debugDescription`仅限直接使用`debugPrint`打印实例的情况，使用`\()`转换成字符串后依然使用的是`description`。
print("\(user)")
debugPrint("\(user)")
//: 不过如果以上两个协议只实现了其中之一的话，那无论`print`还是`debugPrint`都会打印实现的那一个定义的描述。
//: [Next](@next)
