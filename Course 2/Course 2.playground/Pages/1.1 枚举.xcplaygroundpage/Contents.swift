//: ## 1 枚举

//: ### 1.1 枚举基本语法

enum Direction {
    case east
    case west
    case north
    case south
}
//: 使用点语法访问枚举值
var direction = Direction.north
//: 能够推断出枚举类型时，可以省略枚举类型名
direction = .west
print(direction)
if direction == .west {
    print("\(type(of:direction)) \(direction) is \(Direction.west)")
}

//: 使用 `switch` 覆盖枚举
switch direction {
case .east:
    print("go east")
default:
    print("not east")
}
//: 未覆盖所有可能的枚举值时必须有 `default`

switch direction {
case .east, .west:
    print("east or west")
case .north:
    print("go north")
case .south:
    print("go south")
}
//: 已覆盖所有可能的枚举值时不需要 `default`

//: 使用 `: CaseIterable` 声明可迭代的枚举可以使用 `allCases` 属性访问所有可能的选项

//: `CaseIterable` 是一种协议，协议相关内容会在第四课详细介绍
enum IterableDirection: CaseIterable {
    case east, west
    case north, south
}
for direction in IterableDirection.allCases {
    print("go \(direction)")
}

//: [Next](@next)
