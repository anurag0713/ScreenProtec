//
//  ScreenProtec.swift
//  ScreenProtec
//
//  Created by Anurag Singh on 16/02/25.
//

// Example usage in `SceneDelegate`:
// let screenProtec = ScreenProtec(window: window)
// screenProtec.configurePreventionScreenshot()
// screenProtec.enabledPreventScreenshot()

import UIKit

/// A class that provides screenshot prevention by leveraging the secure text entry feature of `UITextField`.
/// Used to block screenshots by overlaying a secure text field on the window.
class ScreenProtec {
    
    /// The window to which the screenshot prevention overlay will be added.
    private var window: UIWindow?
    
    /// A text field used as a screenshot protection layer by enabling `isSecureTextEntry`.
    private var protector = UITextField()
    
    /// Initializes the `ScreenProtec` instance with an optional window.
    /// - Parameter window: The window to apply the screenshot prevention overlay to.
    public init(window: UIWindow? = nil) {
        self.window = window
    }
    
    /// Configures and adds the screenshot prevention overlay to the window if it has not already been added.
    public func configurePreventionScreenshot() {
        // Ensure a valid window is provided before proceeding.
        guard let w = window else { return }
        
        // Check if the protector has not already been added to the window's subviews.
        if !w.subviews.contains(protector) {
            w.addSubview(protector)
            
            // Center the protector in the window.
            protector.centerYAnchor.constraint(equalTo: w.centerYAnchor).isActive = true
            protector.centerXAnchor.constraint(equalTo: w.centerXAnchor).isActive = true
            
            // Add the protector's layer to the window's layer.
            w.layer.superlayer?.addSublayer(protector.layer)
            
            // Adjust layering for different iOS versions.
            if #available(iOS 17.0, *) {
                protector.layer.sublayers?.last?.addSublayer(w.layer)
            } else {
                protector.layer.sublayers?.first?.addSublayer(w.layer)
            }
        }
    }
    
    /// Enables screenshot prevention by setting the protector's `isSecureTextEntry` to `true`.
    public func enabledPreventScreenshot() {
        protector.isSecureTextEntry = true
    }

    /// Disables screenshot prevention by setting the protector's `isSecureTextEntry` to `false`.
    public func disablePreventScreenshot() {
        protector.isSecureTextEntry = false
    }
}
