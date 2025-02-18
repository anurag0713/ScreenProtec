# ScreenProtec

`ScreenProtec` is a simple utility class for iOS applications that leverages `UITextField`'s `isSecureTextEntry` property to prevent users from capturing screenshots. It works by overlaying a secure text field on the application's main window.

## Features

- **Screenshot Prevention**: Blocks screenshots by utilizing `UITextField`'s secure text entry feature.
- **Easy Integration**: Minimal configuration required to activate screenshot protection.
- **Version Handling**: Ensures compatibility with iOS 17 and earlier versions.

## Usage

### Step 1: Initialization

Initialize a `ScreenProtec` instance in your `SceneDelegate`:

```swift
let screenProtec = ScreenProtec(window: window)
```

### Step 2: Configure Protection

Configure the protection layer:

```swift
screenProtec.configurePreventionScreenshot()
```

### Step 3: Enable Screenshot Prevention

Enable the screenshot prevention mechanism:

```swift
screenProtec.enabledPreventScreenshot()
```

### Optional: Disable Screenshot Prevention

If you want to disable screenshot prevention:

```swift
screenProtec.disablePreventScreenshot()
```

## Installation

To add `ScreenProtec` to your project, you can:

1. Download the source file `ScreenProtec.swift` and add it to your project.
2. Import the necessary `UIKit` framework in your file if not already done.

## Example Code

 Example usage in SceneDelegate.
```swift
func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
      guard let _ = (scene as? UIWindowScene) else { return }
      
      let screenProtec = ScreenProtec(window: window)
      screenProtec.configurePreventionScreenshot()
      screenProtec.enabledPreventScreenshot()
}
```

## Limitations

- The solution leverages `UITextField`'s `isSecureTextEntry` property, which may not be foolproof in all scenarios.
- Behavior may vary depending on iOS version and system-specific security mechanisms.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests if you find bugs or have suggestions for improvements and new features.

