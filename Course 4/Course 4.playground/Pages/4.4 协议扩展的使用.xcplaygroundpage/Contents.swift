//: [Previous](@previous)

//: ### 4.3 协议扩展的使用

//: #### 4.3.1 伪可选实现
//: 如果需要使用可选实现，但不想声明`@objc`协议污染Swift环境，可以使用协议扩展来达到类似效果。
//: 在协议中声明一个方法，在协议扩展中提供默认空实现，
//: 如果符合协议的具体类型实现了该方法，则会调用到具体实现，否则则会调用到默认空方法。
protocol SessionDelegate: AnyObject {
    func willStart(_ session: Session)
    func didStart(_ session: Session)
}

extension SessionDelegate {
    func willStart(_ session: Session) { }
    func didStart(_ session: Session) { }
}

class Session {
    weak var delegate: SessionDelegate?

    func start() {
        delegate?.willStart(self)
        // ...
        delegate?.didStart(self)
    }
}

class SessionController: SessionDelegate {
    var session: Session
    init(session: Session) {
        self.session = session
        session.delegate = self
    }
}

//: #### 4.3.2 带`where`子句的协议扩展

//: [Next](@next)
