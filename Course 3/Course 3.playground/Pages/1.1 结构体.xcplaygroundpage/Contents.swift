
//: ## 1 结构体与类

//: ### 1.1 结构体

//: 创建一个描述UGC视频信息的结构体
struct VideoInfo {
    /// AV号
    let avid = 54737593
    /// BV号（生成BVID算法可能改变）
    var bvid = "BV1f4411M7QC"
    /// UP主ID（可能为联合投稿）
    var upers = [163637592]
    /// 标题
    var title = "【何同学】有多快？5G在日常使用中的真实体验"
    /// 描述
    var desc = "BGM：La Ciudad——ODESZA\nRap God—— Eminem\nStronger —— Kanye West\n感谢龚哥从上海帮我办了两次电话卡，感谢我班团支书辅导我数电实验"

    // 实例方法
    func printDespriction() {
        print("AVID：\(avid)",
              "BVID：\(bvid)",
              "UP主：\(upers.map(\.description).joined(separator:(" & ")))",
              "标题：\(title)",
              "描述：\(desc)",
              separator: "\n",
              terminator: "\n\n")
    }

    //: 修改属性值的方法需添加 `mutating` 关键字
    mutating func addUper(_ uper: Int) {
        guard !upers.contains(uper) else {
            return
        }
        upers.append(uper)
    }
}
//: 五个属性，`avid`不可变，其他均可能变化

var video = VideoInfo()

//: 点语法获取属性
print("AVID：\(video.avid)",
      "BVID：\(video.bvid)",
      "UP主：\(video.upers.map(\.description).joined(separator:(" & ")))",
      "标题：\(video.title)",
      "描述：\(video.desc)",
      separator: "\n",
      terminator: "\n\n")

//: 点语法调用函数
video.printDespriction()

//: 修改属性值
video.desc = "百大UP主何同学 5G体验"
video.addUper(8047632)
//: 常量属性不可修改
//video.avid = 2233
video.printDespriction()

//: [Next](@next)
