// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var prefPool: SettingsPool

  /// Approach 1: using a binding
  @Binding var isOn: Bool

  var body: some View {
    VStack {
      Toggle("114 514 1919810 (SwiftUI)", isOn: $isOn)
      Button("Call Cocoa Window") {
        PrefWindowCocoa.show()
      }
    }
    .padding()
    .frame(width: 280, height: 100)
  }
}

/// Apprach 2: Using the publushed value from SettingPool
struct ContentViewUsingPublishedVariable: View {
  @EnvironmentObject var prefPool: SettingsPool

  var body: some View {
    VStack {
      Toggle("114 514 1919810 (SwiftUI)", isOn: $prefPool.the114514)
      Button("Call Cocoa Window") {
        PrefWindowCocoa.show()
      }
    }
    .padding()
    .frame(width: 280, height: 100)
  }
}

// #Preview {
//    ContentView().environmentObject(SettingsPool())
// }
