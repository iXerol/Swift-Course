//: [Previous](@previous)

//: 整个 `switch` 语句会在匹配到第一个 `switch` 情况执行完毕之后退出，不再需要显式的 `break` 语句
let someChar = "z"
switch someChar {
case "a":
    print("first char")
case "z":
    print("last char")
default:
    print("some other char")
}

let responseCode = 404
switch responseCode {
//: 区间匹配
case 100 ..< 200:
    print("请求中")
case 200 ..< 300:
    print("请求成功")
case 300 ..< 400:
    print("重定向")
case 400 ..< 500:
    print("客户端错误")
//: 复合匹配
case 500, 501, 502, 503:
    print("服务器错误")
default:
    print("未知")
}

//: 元组匹配
let onePoint = (1, 1)
switch onePoint {
case (_, 0):
    print("在 X 轴上")
case (0, _):
    print("在 Y 轴上")
case (-2 ... 2, -2 ... 2):
    print("在原点周围 4×4 方框内")
default:
    print("在方框外")
}

//: `switch` 可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用
//: `switch` 可以使用 where 分句来检查额外的情况
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) 在 x == y 函数线上")
case let (x, y) where x == -y:
    print("(\(x), \(y)) 在 x == -y 函数线上")
case (0, _):
    //: 如果你确实需要 C 风格的贯穿行为你可以选择在每个情况末尾使用 `fallthrough` 关键字 !!不建议
    fallthrough
case (_, 0):
    print("(\(anotherPoint.0), \(anotherPoint.1)) 在坐标轴上")
case let (x, y):
    print("(\(x), \(y) 为其他点")
}

//: [Next](@next)
