import Foundation

public class WeiboSDK {
    /// 参数满足条件时 90% 概率分享成功
    /// - Parameter content: 分享的内容。不得为空字符串，空字符串必定分享失败
    public static func share(content: String) -> Bool {
        guard !content.isEmpty else {
            return false
        }
        return Int.random(in: 0 ..< 10) < 9
    }
}

public class WeChatSDK {
    /// 参数满足条件时 90% 概率分享成功
    /// - Parameter title: 分享的标题。不得为空字符串，空字符串必定分享失败
    /// - Parameter desc: 分享的内容。不能与 url 同时为空
    /// - Parameter url: 分享的链接。不能与 desc 同时为空
    public static func share(title: String, desc: String?, url: URL?) -> Bool {
        guard !title.isEmpty,
              ![desc, url?.absoluteString].compactMap({ $0 }).joined().isEmpty else {
            print("empty")
            return false
        }
        return Int.random(in: 0 ..< 10) < 9
    }
}

public class QQSDK {
    /// 参数满足条件时 90% 概率分享成功
    /// - Parameter title: 分享的标题。不得为空字符串，空字符串必定分享失败
    /// - Parameter desc: 分享的内容。不能与 url 同时为空
    /// - Parameter url: 分享的链接。不能与 desc 同时为空
    public static func share(title: String, desc: String?, url: URL?) -> Bool {
        guard !title.isEmpty,
              ![desc, url?.absoluteString].compactMap({ $0 }).joined().isEmpty else {
            print("empty")
            return false
        }
        return Int.random(in: 0 ..< 10) < 9
    }
}
