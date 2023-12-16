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
            TabView {
                
                ContentView(
                    store: Store(initialState: CounterFeature.State()) {
                        CounterFeature()
                            ._printChanges()
                    }
                )
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
                
                ContacTabView(store: Store(initialState: ContactsFeature.State()){
                    ContactsFeature()
                        ._printChanges()
                }) 
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
            }
        }
    }
}

