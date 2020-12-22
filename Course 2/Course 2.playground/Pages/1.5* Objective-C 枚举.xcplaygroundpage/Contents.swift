//: [Previous](@previous)

import Foundation

//: ### 1.5 Objective-C 互操作
//: 本章主要讲的是一些在 Objective-C 中的枚举或形似枚举的成组常量在 Swift 中的使用
//: # ‼️本章节涉及较多「超纲」内容，建议在需要用到的时候回头看
//: [Grouping Related Objective-C Constants](https://developer.apple.com/documentation/swift/objective-c_and_c_code_customization/grouping_related_objective-c_constants)

//: 若需要在 Objective-C 中使用 Swift 枚举，则必须加上 `objc` 修饰符，并且拥有整型原始值

//: 在 Objective-C 中使用 `NS_ENUM` `NS_CLOSED_ENUM` 生成的枚举也会被自动转换成这种形式
@objc
enum PlaybackState: Int {
    case none
    case preparing
    case prepared
    case playing
    case paused
    case stopped
    case failed
}
//: [SE-0192](https://github.com/apple/swift-evolution/blob/master/proposals/0192-non-exhaustive-enums.md)

//: 在 Objective-C 中，使用 `NS_OPTIONS` 生成的选项也是枚举

//: 在 Swift 中，这些选项将被转换为符合 `OptionSet` 协议的结构体
//: 如 `UIControlEvents` `UIViewAnimationOptions`
struct AudioChannels: OptionSet {
    let rawValue: Int

//: 可以与 Objective-C 中一样，使用 bitmask 编码
    static let mono         = AudioChannels(rawValue: 1 << 0)
    static let stereo       = AudioChannels(rawValue: 1 << 1)
    static let multiChannel = AudioChannels(rawValue: 1 << 2)

//: 虽然依然使用 bitmask 编码，但使用数组的形式表现，让选项更易读
    static let monoAndStereo: AudioChannels = [.mono, .stereo]
    static let all: AudioChannels = [.mono, .stereo, .multiChannel]
}

//: 在 Objective-C 中使用 `NS_TYPED_ENUM` `NS_TYPED_EXTENSIBLE_ENUM` 进行类型声明的常量会被转换为原始值形式结构体
//: 如 `AVPlayerWaitingReason` `NSRunLoopMode`
struct ErrorReason: RawRepresentable {
    let rawValue: String

    static let notFound = ErrorReason(rawValue: "Not Found")
}

//: 以上三种情况仅枚举可以 Swift → Objective-C，剩余两者均只能单向 Objective-C → Swift

//: [Next](@next)
