// (c) 2023 and onwards Shiki Suen (MIT License).
// ====================
// This code is released under the MIT license (SPDX-License-Identifier: MIT)

import AppKit

class PrefWindowCocoa: NSWindowController {
  public static var shared: PrefWindowCocoa?

  public static func show() {
    if shared == nil { shared = PrefWindowCocoa(windowNibName: "PrefWindowCocoa") }
    guard let shared = shared, let sharedWindow = shared.window else { return }
    sharedWindow.orderFrontRegardless() // 逼著視窗往最前方顯示
    sharedWindow.level = .statusBar
    sharedWindow.titlebarAppearsTransparent = true
    shared.showWindow(shared)
    NSApp.popup()
  }

  override func windowDidLoad() {
    super.windowDidLoad()
  }
}

// MARK: - NSApp Activation Helper

// This is to deal with changes brought by macOS 14.

public extension NSApplication {
  func popup() {
    #if compiler(>=5.9) && canImport(AppKit, _version: "14.0")
      if #available(macOS 14.0, *) {
        NSApp.activate()
      } else {
        NSApp.activate(ignoringOtherApps: true)
      }
    #else
      NSApp.activate(ignoringOtherApps: true)
    #endif
  }
}
