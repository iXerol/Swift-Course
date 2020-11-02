//: [Previous](@previous)

//:整个 switch 语句会在匹配到第一个 switch 情况执行完毕之后退出，不再需要显式的 break 语句
let someChar = "z"
switch someChar {
case "a":
    print("first char")
case "z":
    print("last char")
default:
    print("some other char")
}


//:区间匹配、复合匹配
let responseCode = 404
switch responseCode {
case 100..<200:
    print("请求中")
case 200..<300:
    print("请求成功")
case 300..<400:
    print("重定向")
case 400..<500:
    print("客户机中出现的错误")
case 500, 501, 502, 503:
    print("服务器中出现的错误")
default:
    print("未知")
}

//:元组匹配
let onePoint = (1, 1)
switch onePoint {
case (_, 0):
    print("on x-axis")
case (0, _):
    print("on y-axis")
case (-2...2, -2...2):
    print("inside the box")
default:
    print("outside the box")
}

//:switch 情况可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用
//:switch 情况可以使用 where 分句来检查额外的情况
let anotherPoint = (1, -1)
switch anotherPoint {
case let (x, y) where x == y:
    print("\(x), \(y) on x == y line")
case let (x, y) where x == -y:
    print("\(x), \(y) on x == -y line")
default:
    print("some arbitrary point")
}

//:如果你确实需要 C 风格的贯穿行为你可以选择在每个情况末尾使用 fallthrough 关键字 !!不建议


//: [Next](@next)
