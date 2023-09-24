# SwiftUI 某个可能是 Bug 的地方

## 前言

发现一个颇有意思的：

打比方说你自己给你的 App 弄了两版偏好设定视窗，其中一个用了 SwiftUI、另一个用了 XIB。下文称前者为「A窗」、后者为「B窗」。

然后呢，有个 UserDefaults，Key 随便起名 `"114514"` 也行，类型是 Bool（随便选受支持的类型都可以）。

## 先说正常情况：

你在A窗的用到了这个参数的地方「就地开了个 `@AppStorage()`」来存取这个 UserDefaults 的话，你对 A 窗的操作会无条件实时反馈到 B 窗上，反之亦然。

## 然后讲一下我发现的不正常的情况。

测试环境是 Xcode 15.0 正式版 + macOS 14.0 (23A344)。

你想一想：如果你一个 App 的 UserDefaults 数量过多的话……
打比方说这样改设计好了（我不知道有没有更好的方案）：
首先，弄一个 ObservableObject （起名为 SettingsPool），里面的成员参数都是 AppStorage（自然会包括上文A窗B窗用到的那个 UserDefaults 参数）。

然后呢，A窗的 SwiftUI 根视图使用 `@StateObject var prefPool: SettingsPool = .init()`。

接下来，A窗的所有在这个根视图之下的视图都使用 `@EnvironmentObject var prefPool: SettingsPool` 存取这个物件，且删掉上文最开始提到的「就地开了个」的参数、改用新的 EnvironmentObject。

这时候你再测试一下 AB 窗彼此之间的操作互馈，你会发现：

如果一开始先操作 B 窗的话，无论你怎么操作，A 都会反应。

如果一开始先操作 A 窗的话，B 窗会有反应……但此时你再操作 B 窗的话，A 窗没反应了。

就特别怪，总之我是不知道是我哪里搞错了。

## 补充

如果你没有用 EnvironmentObject、而是直接将 StateObject 塞在原先 AppStorage 所在的那个 Struct 内的话，也是一样的结果。

总之我是不知道是我哪里搞错了。

$ EOF.
