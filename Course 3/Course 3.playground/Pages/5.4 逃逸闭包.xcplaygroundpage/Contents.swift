//: [Previous](@previous)

//: ### 5.4 逃逸闭包

class PlayingManager {
    typealias CommandHandler = () -> Void

    var playHandler: CommandHandler?

    func setup(completion: () -> Void) {
        print("setup")
        completion()
    }

    func addPlayHandler(_ handler: @escaping () -> Void) {
        playHandler = handler
    }
}

class Player {
    let manager = PlayingManager()

    init() {
        manager.addPlayHandler { [weak self] in
            self?.play()
        }
        manager.setup {
            play()
        }
    }

    func play() {
        print("play")
    }
}

var player: Player? = Player()
player = nil

//: `PlayingManager`的两个方法的参数同样是`() -> Void`类型的闭包，一个需要添加`@escaping`标记，一个不需要。在调用时，一个在闭包内调用方法时必须显式声明`self`，一个可以省略`self`。
//: 这是因为`setup`方法的闭包参数一定会在方法内部执行完毕然后被释放，而`addPlayHandler`的闭包参数逃到了方法体外部，不会在函数体内执行完。Swift能够自动判断，前者一定不会引起循环引用，因此可以简写。后者需要使用`@escaping`与显式的`self`来提醒开发者务必注意到可能产生的循环引用问题。

//: [Next](@next)
