// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

struct ContentView: View {
  @StateObject var prefPool = SettingsPool()
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

#Preview {
  ContentView().environmentObject(SettingsPool())
}
