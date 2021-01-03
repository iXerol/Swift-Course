//: [Previous](@previous)

//: 如果希望和 C 系语言枚举类型一样拥有底层的整型的话，可以为为枚举添加整型的原始值（raw value）类型
enum PlaybackState: Int {
    case none // 0
    case preparing // 1
    case prepared // 2
    case playing // 3
    case paused // 4
    case stopped = 10
    case failed = 11
}
//: 原始值为整型时，可以不指定枚举值，枚举值会自动推断为从`0`开始递增的自然数

var state: PlaybackState
state = .none
print(state, state.rawValue)
state = .prepared
print(state, state.rawValue)
state = .stopped
print(state, state.rawValue)

//: 也可以使用原始值初始化枚举值

//: 由于枚举不一定包含该原始值，因此可能失败，返回空值
let preparingState = PlaybackState(rawValue: 1)
let nilState = PlaybackState(rawValue: 7)
print(preparingState, nilState)

//: 除任意整型之外，原始值还可以为 String, Character 以及任意浮点型

//: 原始值为 `String` 时，枚举值自动推断为成员名
enum ProgrammingLanguage: String {
    case swift
    case objectiveC = "objective-c"
    case cpp = "c++"
    case c
    case `nil` // Custom new language
}
print(ProgrammingLanguage.swift, ProgrammingLanguage.cpp, ProgrammingLanguage.nil)


//: [Next](@next)
