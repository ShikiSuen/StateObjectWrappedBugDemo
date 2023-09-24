// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

@main
struct StateObjectWrappedBugDemoApp: App {
  @StateObject var prefPool = SettingsPool()
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(prefPool).fixedSize()
    }.windowResizability(.contentSize)
  }
}
