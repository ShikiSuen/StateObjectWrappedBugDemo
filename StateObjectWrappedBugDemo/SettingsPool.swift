// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

public class SettingsPool: ObservableObject {
  @Published var the114514: Bool = true

  func set(value: Bool) {
    UserDefaults.standard.setValue(value, forKey: "114514")
  }

  func getValue() -> Bool {
    UserDefaults.standard.bool(forKey: "114514")
  }
}
