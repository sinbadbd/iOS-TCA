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
                return .none
                
                
            case .incrementButtonTapped:
                state.count += 1
                return .none
                
                
            case .numberFactButtonTapped:
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(
                        from: URL(string: "http://numbersapi.com/\(count)/trivia")!
                    )
                    await send(
                        .numberFactResponse(String(decoding: data, as: UTF8.self))
                    )
                }
                
                
            case let .numberFactResponse(fact):
                state.numberFactAlert = fact
                return .none
            }
        }
    }
}
