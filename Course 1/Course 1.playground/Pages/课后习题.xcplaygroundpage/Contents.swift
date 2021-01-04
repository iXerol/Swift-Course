//: [Previous](@previous)
//#-hidden-code
import Foundation
//#-end-hidden-code
/*:
## 课后习题 实现UGC内容简易分享

1. 标题(`title`)、描述(`desc`)、链接(`url`)为不可变内容

2.描述、连接可能有一个为空，但至少有一个有值才能分享

3.播放量(`playCount`)为可变内容，分享时才能确定

4.播放量为数字类型，分享时需要转化为XX万

5.分享包含多种渠道判断，每种渠道分享内容有差异
 - 微博分享：当描述和链接都存在的时候，需要链接追加到描述中
 - QQ分享、微信分享: 不需要播放量
 - 微信分享：连接需要额外追加来源字段`from`

6.分享完成后输出分享结果
 */

/*:
样例：{
    "title": "小电视",
    "desc": "bilibili",
    "playCount": 2233,
    "url": "https://bilibili.com"
}

 微博："【小电视】bilibili 播放量：2233 https://bilibili.com"

 微信：{ "title": "小电视", "desc": "bilibili", "url": "https://bilibili.com", "from": "bilibili" }

 QQ：{ "title": "小电视", "desc": "bilibili", "url": "https://bilibili.com" }
 */

//: SDK 使用样例
var success: Bool
success = WeiboSDK.share(content: "bilibili")
success = WeChatSDK.share(title: "bilibili", desc: "ビリビリ", url: nil, from: "bilibili")
success = QQSDK.share(title: "bilibili", desc: nil, url: URL(string: "bilibili://"))

//: 来实现这个函数吧！
func share(title: String, desc: String?, url: URL?, playCount: Int, to platform: String) -> Bool {
    //#-editable-code
    return true
    //#-end-editable-code
}

//: Test Code
//#-editable-code
share(title: "【循环向】跟着雷总摇起来！Are you OK！",
      desc: """
    自制 小作品，技术含量不高，不成敬意。建议先看原版av2254311。看了雷总的发布会整个人都RUOK了，学了这么多年的英语口音全回不去了。虽然是英语歌，但我相信是个碰过英语书的肯定都能听懂。BGM：Angelina   PS：如果有字幕君看到的话请帮忙在0‘4’‘120到2’7‘’000之间加个循环，需要代码弹幕授权的话请私信戳死我，十分感谢！来吧！丶(°∀°)Are you OK?(°∀°)ﾉ
    """,
      url: URL(string: "https://www.bilibili.com/video/BV1es411D7sW"),
      playCount: 34710000,
      to: "Weibo")
//#-end-editable-code
