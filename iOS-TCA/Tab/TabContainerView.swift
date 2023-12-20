//
//  TabContainerView.swift
//  iOS-TCA
//
//  Created by Imran on 20/12/23.
//
import ComposableArchitecture
import SwiftUI

struct TabContainerView: View {
    
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            
            ContentView(store: store.scope(state: \.tab1, action: \.tab1))
                .tabItem {
                    Text("Counter 1")
                }
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            
            ContacTabView(store: store.scope(state: \.tab2, action: \.tab2))
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    // #Preview {
    TabContainerView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
    //  }
    /*
     TabContainerView(store1: .init(initialState: CounterFeature.State(), reducer: {
     CounterFeature()
     }), store2: .init(initialState: ContactsFeature.State(), reducer: {
     ContactsFeature()
     }))*/
}
