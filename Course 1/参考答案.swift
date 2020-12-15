import Foundation

func share(title: String, desc: String?, url: URL?, playCount: Int, to platform: String) -> Bool {
    guard !title.isEmpty, desc != nil || url != nil else { return false }
    switch platform {
    case "Weibo":
        let playcountDesc = playCount >= 10000 ? String(format: "%.2f万", Double(playCount) / 10000.0 ) : "\(playCount)"
        return WeiboSDK.share(content:"\(title) \(desc?.appending(" ") ?? "")播放量：\(playcountDesc) \(url?.absoluteString ?? "")")
    case "WeChat":
        return WeChatSDK.share(title: title, desc: desc, url: url)
    case "QQ":
        return QQSDK.share(title: title, desc: desc, url: url)
    default:
        return false
    }
}

