//
//  CounterFeature.swift
//  iOS-TCA
//
//  Created by Imran on 14/12/23.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct CounterFeature {
    struct State: Equatable {
        var count = 0
        var numberFactAlert: String? = nil
        var isLoading = false
    }
    
    
    enum Action {
        case factAlertDismissed
        case decrementButtonTapped
        case incrementButtonTapped
        case numberFactButtonTapped
        case numberFactResponse(String)
    }
    
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .factAlertDismissed:
                state.numberFactAlert = nil
                return .none
                
                
            case .decrementButtonTapped:
                state.count -= 1
                state.numberFactAlert = nil
                return .none
                
                
            case .incrementButtonTapped:
                state.numberFactAlert = nil
                state.count += 1
                return .none
                
                
            case .numberFactButtonTapped:
                state.numberFactAlert = nil
                state.isLoading = true
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared
                        .data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.numberFactResponse(fact))
                }
                
            case let .numberFactResponse(fact):
                state.numberFactAlert = fact
                return .none
            }
        }
    }
}
