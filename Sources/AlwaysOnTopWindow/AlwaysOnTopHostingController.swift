//
//  AlwaysOnTopHostingController.swift
//  AlwaysOnTopWindow
//
//  Created by Mashal Ibrahim on 10/12/2024.
//


import SwiftUI
/// A custom UIHostingController to handle SwiftUI views for AlwaysOnTopWindow.
class AlwaysOnTopHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
}
