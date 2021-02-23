//: [Previous](@previous)

//: ### 2.4 类型属性

//: 与类型方法一样，使用`static`声明类型属性。
//: 常用于结构体常量、类的单例。

struct Rect {
    var width: Double
    var height: Double
    static let zero = Rect(width: 0, height: 0)
}
let rect = Rect.zero

class Player { }
class PlayerFocusManager {
    var focusPlayer: Player?
//: 对于所有的全局变量，都会在底层使⽤类似`dispatch_once`的⽅式来确保只初始化⼀次，因此可以直接使用`static let`声明单例。
    static let shared = PlayerFocusManager()

//: 计算属性可使用`class`声明，可被子类重写。
    class var hasFocusPlayer: Bool {
        return shared.focusPlayer != nil
    }
}

class FocusManager: PlayerFocusManager {
    override class var hasFocusPlayer: Bool {
        return false
    }
}

//: [Next](@next)
