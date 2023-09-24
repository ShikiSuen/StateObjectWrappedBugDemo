// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import SwiftUI

public class SettingsPool: NSObject, ObservableObject {
  @AppStorage(wrappedValue: true, "114514")
  public var the114514: Bool
}
