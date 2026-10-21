# 人生 BUG 修復所 🛠️

LifeBugFix（Life.exe）是一款以 SwiftUI 製作的趣味 iOS App，將生活煩惱模擬成電腦 BUG。

## 功能

- **開始掃描 BUG**：隨機顯示六種生活情境之一，包括拖延、睡眠不足、選擇困難、社交疲勞、健忘與錢包餘額不足。
- **立即修復**：顯示對應的幽默解決方案。
- **重新開機**：回到初始待機畫面。
- 利用 `@State` 管理待機、發現 BUG、修復完成三種畫面狀態。

> 本專案屬於趣味模擬，不會實際偵測裝置使用時間或修改系統設定。

## 技術

Swift、SwiftUI、`@State`、自訂深色系介面。

## 執行方式

1. 在 macOS 的 Xcode 開啟 `LifeBugFix.xcodeproj`。
2. 選擇 iOS 模擬器或已設定簽署的實體裝置。
3. 按下 **Run (⌘R)**。

## 專案結構

```text
LifeBugFix/
├── LifeBugFix.xcodeproj/
└── LifeBugFix/
    ├── MyApp.swift         # App 入口
    ├── ContentView.swift   # 主畫面及互動
    ├── BUG.swift           # BUG 資料模型
    ├── AppColor.swift      # 自訂色彩
    └── Assets.xcassets/
```

## 學習重點

練習 SwiftUI 版面配置、按鈕事件、資料模型，以及畫面狀態的切換。
