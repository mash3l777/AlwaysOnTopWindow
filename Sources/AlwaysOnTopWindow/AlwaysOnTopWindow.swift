//
//  AlwaysOnTopWindow.swift
//  AlwaysOnTopWindow
//
//  Created by Mashal Ibrahim on 10/12/2024.
//


import UIKit
import SwiftUI

/// A custom UIWindow that always stays on top of the main window.
class AlwaysOnTopWindow: UIWindow {
    /// Initializes a new AlwaysOnTopWindow instance with a specified SwiftUI view.
    /// - Parameters:
    ///   - scene: The UIWindowScene to associate with this window.
    ///   - contentView: The SwiftUI view to display in the window.
    init<Content: View>(scene: UIWindowScene, contentView: Content) {
        super.init(frame: UIScreen.main.bounds)
        self.windowScene = scene
        configureWindow(with: contentView)
    }

    /// Configures the window's properties and root view controller with the given SwiftUI view.
    /// - Parameter contentView: The SwiftUI view to set as the root view.
    private func configureWindow<Content: View>(with contentView: Content) {
        isOpaque = false
        backgroundColor = .clear
        windowLevel = .alert + 1
        rootViewController = AlwaysOnTopHostingController(rootView: contentView)
        isHidden = false
    }

    /// Sets the size and position of the window.
    /// - Parameters:
    ///   - size: The new size of the window.
    ///   - position: The new position of the window (optional, defaults to current position).
    func setSizeAndPosition(size: CGSize, position: CGPoint? = nil) {
        DispatchQueue.main.async {
            self.frame.size = size
            if let position = position {
                self.frame.origin = position
            }
        }
    }

    /// Creates an AlwaysOnTopWindow for the current active scene with a specified SwiftUI view.
    /// - Parameter contentView: The SwiftUI view to display in the window.
    /// - Returns: An optional AlwaysOnTopWindow instance.
    static func createForCurrentScene<Content: View>(contentView: Content) -> AlwaysOnTopWindow? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("No active UIWindowScene found.")
            return nil
        }
        return AlwaysOnTopWindow(scene: scene, contentView: contentView)
    }

    /// Makes the window visible.
    func show() {
        isHidden = false
    }

    /// Hides the window.
    /// - Parameter ifHidden: Whether to hide the window. Default is true.
    func hide(ifHidden: Bool = true) {
        isHidden = ifHidden
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
