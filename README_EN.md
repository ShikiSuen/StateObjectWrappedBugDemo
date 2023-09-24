# Communication error via UserDefaults between SwiftUI and AppKit.

## Preface

Suppose that you prepared two versions of Settings window: "PrefA" written in SwiftUI, and "PrefB" created using XIB.

And, you have a UserDefaults key (Bool) named as "114514". // Just for instance.

Testing environment: Xcode 15.0 GM + macOS 14.0 (23A344)。

## What works:

In the struct (Struct-A) where you directly access "114514", you use AppStorage to access it in-place.

In this case, your action to PrefA always reflects on PrefB. Vice versa.

## What malfunctions:

Steps:

1. Suppose that you have too many UserDefaults keys to handle, and you might want to package these as an observable AppStorage container.

2. We create a class conforming to ObservableObject, and we add all userdefaults into it. This includes the "114514".

3. In the container view / struct of all views (incl. Struct-A) using those UserDefaults (or simply in the `App`), we implement `@StateObject var prefPool: SettingsPool = .init()`, passing it into the subView using `.environmentObject(prefPool)`.

4. Then, in the PrefA, all places accessing UserDefault parameters implement `@EnvironmentObject var prefPool: SettingsPool`. This replaces the initial AppStorage parameter "114514" in the Struct-A.

Now, you test-run, and you will find:

* If you toggled the 114514 in the PrefB at first, PrefA reflects the change.
* If you toggled the 114514 in the PrefA at first, PrefB reflects the change. However, since then, if you continue toggling the 114514 in the PrefB, PrefA responds nothing.

I dunno where did I screw off.

## Additionally

Even if you put the `@StateObject var prefPool: SettingsPool = .init()` into Struct-A, this issue still exists.

$ EOF.
