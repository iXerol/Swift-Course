//: [Previous](@previous)
//: ### 3.2 `guard`

let names: [(String, String)] =
    [("Tim", "Cook"),
     ("", "Lee"),
     ("Steve", "Jobs"),
     ("Mickey", "")]
//: 使用 `guard` 确保条件符合，防止代码在不当条件下运行
//: 在 `else` 内必须包含退出当前作用域的代码

for (firstName, lastName) in names {
    guard !firstName.isEmpty, !lastName.isEmpty else {
        continue
    }
    print("First name: \(firstName)\nLast name: \(lastName)")
}

//: `guard` 与 `if-else` 很相似，但意义不同
//: 以下使用 `if` 实现的代码与以上代码等价
//: 这段代码的目的是要确保姓名均非空，使用 `guard` 更符合直觉，而且避免了条件更多时的多层嵌套

for (firstName, lastName) in names {
    if firstName.isEmpty || lastName.isEmpty {
        continue
    } else {
        print("First name: \(firstName)\nLast name: \(lastName)")
    }
}

//: [Next](@next)
