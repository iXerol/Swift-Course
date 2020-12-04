//: ## 枚举

enum Alignment {
    case left
    case right
    case center
    case justify
}

var alignment = Alignment.center
alignment = .right
print(alignment)
if alignment == .right {
    print("\(type(of:alignment)) \(alignment) is \(Alignment.right)")
}

//: 使用 `switch` 覆盖枚举

switch alignment {
case .left:
    print("left aligned")
default:
    print("not left aligned")
}
//: 未覆盖所有可能的枚举值时必须有 `default`

switch alignment {
case .left, .right:
    print("not in center")
case .center:
    print("in center")
case .justify:
    print("width is justified")
}
//: 已覆盖所有可能的枚举值时不需要 `default`

//: [Next](@next)
