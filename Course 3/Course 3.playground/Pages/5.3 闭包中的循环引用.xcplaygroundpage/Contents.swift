//: [Previous](@previous)

//: ### 5.3 闭包中的循环引用

//: 闭包是引用类型，同时也能够捕获外部变量。被闭包捕获的外部变量会被闭包持有，增加一次引用计数。

class PlayingManager {
    typealias CommandHandler = () -> Void

    var playHandler: CommandHandler?

    deinit {
        print("playing manager deinit")
    }
}

class Player {
    let manager = PlayingManager()

    init() {
        manager.playHandler = {
            self.play()
        }
//        manager.playHandler = { [weak self] in
//            self?.play()
//        }
//        manager.playHandler = { [weak self] in
//            guard let self = self else {
//                return
//            }
//            self.play()
//        }
//        manager.playHandler = { [unowned self] in
//            self.play()
//        }
    }

    func play() {}

    deinit {
        print("player deinit")
    }
}

var player: Player? = Player()
player = nil

//: 虽然只有`Player`强引用了`PlayingManger`，`PlayingManager`并没有强引用`Player`，但还是产生了循环引用，`Player`和`PlayingManager`没有被释放。因为`Player`的初始化方法中添加的闭包捕获了外部的`self`，也就是强引用了`Player`，同时该闭包也被`PlayingManager`持有，这导致三者之间产生循环引用。

//: 可以在闭包的`in`之前添加`[weak self]`，来使闭包对`self`的引用变为弱引用，就能打破循环引用。这相当于在闭包内部声明了一个变量，类似于`weak var self: Self? = self`。需要注意，由于使用`weak`声明，此时内部的`self`是可空类型，内部逻辑也需要考虑到`self`为空的情况。也可以使用`guard let self = self`的方式确保`self`非空才执行之后的语句。

//: 另外也有与Objective-C中的`unsafe_unretained`类似的`unowned`，也可以打破循环引用。使用`unowned`会使ARC失效，不会增加引用计数，也不会确保非空，如果访问`unowned`变量时为控制则会在运行时崩溃，开发者必须在完全肯定其值不可能为空时才使用`unowned`。不过由于`weak`在实例释放后变为`nil`的特性会导致一定的消耗，`unowned`相比`weak`能够带来少量的性能提升。

//: [Next](@next)
