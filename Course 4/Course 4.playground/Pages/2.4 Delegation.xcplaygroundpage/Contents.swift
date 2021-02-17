//: [Previous](@previous)

//: ### 2.4 Delegation

//: [委托模式（Delegate Pattern）](https://zh.wikipedia.org/zh-hans/委托模式)是Cocoa中很常使用的一种设计模式，并不直接与Swift语言相关，但是协议的一种常见使用场景。

//: 由于delegate的特性，其必须为引用类型。AnyObject表示所有类及Objective-C对象，表示其为引用类型，结构体/枚举等值类型不会满足该条件。
protocol GameDelegate: AnyObject {
    func gameDidStart(_ game: Game)
    func gameDidEnd(_ game: Game)
}

class Game {
//: 使用`weak`声明弱引用delegate
    weak var delegate: GameDelegate?

    func start() {
        delegate?.gameDidStart(self)
    }

    func end() {
        delegate?.gameDidEnd(self)
    }
}

class Manager: GameDelegate {
    func gameDidStart(_ game: Game) {
        print("did start")
    }

    func gameDidEnd(_ game: Game) {
        print("did end")
    }
}

let game = Game()
let manager = Manager()
game.delegate = manager
game.start()
game.end()

//: [Next](@next)
