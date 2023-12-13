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
  
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: CounterFeature.State()) {
                    CounterFeature()
                }
            )
        }
    }
}

