//
//  TCAApp.swift
//  iOS-TCA
//
//  Created by Imran on 13/12/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCAApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    var body: some Scene {
        WindowGroup {
            TabView {
                TabContainerView(store: TCAApp.store)
            }
        }
    }
}

