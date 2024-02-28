//
//  ContentView.swift
//  ios
//
//  Created by Oleg Novosad on 26.02.2024.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

struct ContentView: View {
    var body: some View {
        VStack {
            ProgressView()
            Spacer()
            Button("📱Play while waiting") {
                showFlutter()
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

func showFlutter() {
    // Get the RootViewController.
    guard
        let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
        let window = windowScene.windows.first(where: \.isKeyWindow),
        let rootViewController = window.rootViewController
    else { return }
    
    let flutterEngine = FlutterEngine(name: "my flutter engine")
    
    // Runs the default Dart entrypoint with a default Flutter route.
    flutterEngine.run()
    // Connects plugins with iOS platform code to this app.
    GeneratedPluginRegistrant.register(with: flutterEngine);
    
    // Create the FlutterViewController.
    let flutterViewController = FlutterViewController(
        engine: flutterEngine,
        nibName: nil,
        bundle: nil)
    flutterViewController.modalPresentationStyle = .overCurrentContext
    flutterViewController.isViewOpaque = false
    
    rootViewController.present(flutterViewController, animated: true)
}
