# AlwaysOnTopWindow🕴️

A lightweight Swift library to create a custom `UIWindow` that always stays on top of the main application window. Ideal for displaying floating views, persistent overlays, or custom alerts with dynamic size, position, and SwiftUI integration.

## Features✨

- **Always-on-top behavior:** Ensures the window stays visible above other app windows.
- **Dynamic content:** Supports any SwiftUI `View` for seamless integration.
- **Customizable size and position:** Easily configure the window's frame programmatically.
- **Clear background support:** Perfect for overlays and transparent views.
- **SwiftUI-first design:** Built with modern SwiftUI integration in mind.

## 📋

- iOS 13.0+
- Swift 6.0+

## Installation🛠️

### Swift Package Manager (SPM)

1. Open your project in Xcode.
2. Go to **File > Add Packages...**.
3. Enter the repository URL: `https://github.com/mash3l777/AlwaysOnTopWindow`
4. Select the package and add it to your project.

## Usage📖

### 1. Create an `AlwaysOnTopWindow`

To create an `AlwaysOnTopWindow`, use the static `createForCurrentScene(contentView:)` method and pass any SwiftUI `View` as the content:

```swift
import AlwaysOnTopWindow
import SwiftUI

struct CustomView: View {
    var body: some View {
        Text("Hello, Always On Top!")
            .padding()
            .background(Color.blue.opacity(0.8))
            .cornerRadius(10)
    }
}

// Create and display the window
if let alwaysOnTopWindow = AlwaysOnTopWindow.createForCurrentScene(contentView: CustomView()) {
    alwaysOnTopWindow.show()
}
```
### 2. Customize Size and Position

You can adjust the window's size and position programmatically using the `setSizeAndPosition(size:position:)` method:

```swift
alwaysOnTopWindow.setSizeAndPosition(
    size: CGSize(width: 300, height: 200),
    position: CGPoint(x: 50, y: 100)
)
```

### 3. Center the Window

To center the window, calculate the position based on the screen size:

```swift
let screenSize = UIScreen.main.bounds.size
let windowSize = CGSize(width: 300, height: 200)
let centerPosition = CGPoint(
    x: (screenSize.width - windowSize.width) / 2,
    y: (screenSize.height - windowSize.height) / 2
)

alwaysOnTopWindow.setSizeAndPosition(size: windowSize, position: centerPosition)
```
### 4. Hide or Show the Window

Control the visibility of the window using `show()` and `hide()` methods:

```swift
// Show the window
alwaysOnTopWindow.show()

// Hide the window
alwaysOnTopWindow.hide()
```

## Contributing🤝

Contributions are welcome! Please refer to our [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on how to get started.


## License📜

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

