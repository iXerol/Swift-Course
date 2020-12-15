//: [Previous](@previous)

import Foundation

//: SDK 使用样例
var success: Bool
success = WeiboSDK.share(content: "bilibili")
success = WeChatSDK.share(title: "bilibili", desc: "ビリビリ", url: nil)
success = QQSDK.share(title: "bilibili", desc: nil, url: URL(string: "bilibili://"))

func share(title: String, desc: String?, url: URL?, playCount: Int, to platform: String) -> Bool {
    //#-editable-code
    return true
    //#-end-editable-code
}

//: Test Code
//#-editable-code
share(title: "【循环向】跟着雷总摇起来！Are you OK！",
      desc: """
    自制 小作品，技术含量不高，不成敬意。建议先看原版av2254311。看了雷总的发布会整个人都RUOK了，学了这么多年的英语口音全回不去了。虽然是英语歌，但我相信是个碰过英语书的肯定都能听懂。BGM：Angelina PS：如果有字幕君看到的话请帮忙在0‘4’‘120到2’7‘’000之间加个循环，需要代码弹幕授权的话请私信戳死我，十分感谢！来吧！丶(°∀°)Are you OK?(°∀°)ﾉ
    """,
      url: URL(string: "https://www.bilibili.com/video/BV1es411D7sW"),
      playCount: 34710000,
      to: "Weibo")
//#-end-editable-code
