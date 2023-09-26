// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

@main
struct StateObjectWrappedBugDemoApp: App {
  @StateObject var prefPool = SettingsPool()

  @AppStorage(wrappedValue: true, "114514")
  public var the114514: Bool

  var body: some Scene {
    WindowGroup {
      ContentView(isOn: $the114514)
        .environmentObject(prefPool)
        .fixedSize()

      /// Apprach 2:  Observing the publushed value from SettingPool
//                .onChange(of: prefPool.the114514) { newValue in
//                    self.the114514 = newValue
//                }
    }.windowResizability(.contentSize)
  }
}
