//: [Previous](@previous)

import Foundation
//: ### 4.2 Objective-C协议

//: Objetive-C的协议与Swift的协议有很大不同，比如Objective-C的协议的方法可以声明为可选实现。
//: 声明为`@objc`的协议中出现的所有类型必须在Objective-C下可见。
@objc
protocol SessionDelegate {
//: 声明为`@objc`的协议才可以使用可选方法，且可选方法也必须使用`@objc`声明
    @objc
    optional func willStart(_ session: Session)

    @objc
    optional func didStart(_ session: Session)
}

//: 使用`@objc`声明Objective-C可见的类，必须为`NSObject`的子类。
@objc
class Session: NSObject {
    weak var delegate: SessionDelegate?

    func start() {
//: 调用可选方法需要在方法名后添加问号。
        delegate?.willStart?(self)
        // ...
        delegate?.didStart?(self)
    }
}

//: 未声明`@objc`的Swift类也可以符合声明`@objc`的协议
class SwiftClass: SessionDelegate { }
let object = SwiftClass()

//: [Next](@next)
