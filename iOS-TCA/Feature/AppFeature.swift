//
//  AppFeature.swift
//  iOS-TCA
//
//  Created by Imran on 20/12/23.
//

import ComposableArchitecture

@Reducer
struct AppFeature {
    
    struct State{
        var tab1 = CounterFeature.State()
        var tab2 = ContactsFeature.State()
    }
    
    enum Action{
        case tab1(CounterFeature.Action)
        case tab2(ContactsFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }
        Scope(state: \.tab2, action: \.tab2) {
            ContactsFeature()
        }
        Reduce { state, action in
            // Core logic of the app feature
            return .none
        }
    }
    
}
