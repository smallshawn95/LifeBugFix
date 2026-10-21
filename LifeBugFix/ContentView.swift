import SwiftUI

struct ContentView: View {
    let bugs: [BUG] = [
        BUG(
            emoji: "📱",
            name: "拖延症.exe",
            description: "偵測到你已經滑手機 3 小時，作業進度依然是 0%。",
            solution: "修復完成！已安裝 5 分鐘專注模式。"
        ),
        BUG(
            emoji: "😴",
            name: "電量不足.exe",
            description: "偵測到睡眠系統故障，喝三杯咖啡也沒有用。",
            solution: "修復完成！已獲得一張合法午睡券。"
        ),
        BUG(
            emoji: "🤯",
            name: "選擇困難.exe",
            description: "偵測到你花了 30 分鐘，還是選不出晚餐。",
            solution: "修復完成！今天就吃火鍋吧！"
        ),
        BUG(
            emoji: "😶",
            name: "社交電量歸零.exe",
            description: "偵測到今天說了太多話，已經不想跟任何人交流。",
            solution: "修復完成！已啟動勿擾模式，今天可以不用社交。"
        ),
        BUG(
            emoji: "🧠",
            name: "記憶體不足.exe",
            description: "偵測到剛剛想做的事情，過了 3 秒就忘記了。",
            solution: "修復完成！已清除腦袋快取，恢復部分記憶。"
        ),
        BUG(
            emoji: "👛",
            name: "錢包餘額不足.exe",
            description: "偵測到月底還沒到，錢包卻已經進入省電模式。",
            solution: "修復完成！已啟動省錢模式，今天禁止亂買東西。"
        )
    ]

    @State private var bugIndex = 0
    @State private var hasScanned = false
    @State private var isFixed = false

    var body: some View {
        ZStack {
            AppColor.background
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    HStack(spacing: 8) {
                        Image(systemName: "terminal")

                        Text("Life.exe")
                            .fontWeight(.semibold)

                        Spacer()

                        Text("SYSTEM v1.0")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    .foregroundStyle(AppColor.mint)

                    Divider()
                        .overlay(Color.gray.opacity(0.3))

                    VStack(spacing: 10) {
                        Text("人生 BUG 修復所")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.white)

                        Text("你的生活，由我來修復。")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    .padding(.top, 15)

                    VStack(spacing: 18) {
                        if hasScanned == false {
                            Text("🤖")
                                .font(.system(size: 80))

                            Text("系統待機中")
                                .font(.headline)
                                .foregroundStyle(AppColor.secondary)

                            Text("等待掃描")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            Text("點擊下方按鈕，診斷你今天的人生狀態。")
                                .font(.subheadline)
                                .foregroundStyle(AppColor.secondary)
                                .multilineTextAlignment(.center)
                        } else if isFixed == true {
                            Text("✅")
                                .font(.system(size: 80))

                            Text("BUG 修復成功")
                                .font(.headline)
                                .foregroundStyle(AppColor.mint)

                            Text("系統已恢復正常")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            Text(bugs[bugIndex].solution)
                                .font(.subheadline)
                                .foregroundStyle(AppColor.secondary)
                                .multilineTextAlignment(.center)
                                .lineSpacing(5)
                        } else {
                            Text(bugs[bugIndex].emoji)
                                .font(.system(size: 80))

                            Text("⚠️ 發現人生 BUG")
                                .font(.headline)
                                .foregroundStyle(AppColor.orange)

                            Text(bugs[bugIndex].name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)

                            Text(bugs[bugIndex].description)
                                .font(.subheadline)
                                .foregroundStyle(AppColor.secondary)
                                .multilineTextAlignment(.center)
                                .lineSpacing(5)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 250)
                    .padding(24)
                    .background(AppColor.card)
                    .cornerRadius(24)

                    VStack(spacing: 12) {
                        Button("開始掃描 BUG", systemImage: "viewfinder") {
                            bugIndex = Int.random(in: 0..<bugs.count)
                            hasScanned = true
                            isFixed = false
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColor.background)
                        .background(AppColor.mint)
                        .cornerRadius(14)

                        Button("立即修復", systemImage: "wrench.and.screwdriver") {
                            isFixed = true
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColor.background)
                        .background(Color.green.opacity(0.85))
                        .cornerRadius(14)
                        .disabled(hasScanned == false || isFixed == true)

                        Button("重新開機", systemImage: "arrow.clockwise") {
                            bugIndex = 0
                            hasScanned = false
                            isFixed = false
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .fontWeight(.semibold)
                        .foregroundStyle(AppColor.secondary)
                        .overlay {
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)

                    Text("LIFE OS © 2026 • 人生偶爾故障很正常")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                        .padding(.top, 12)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 28)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
