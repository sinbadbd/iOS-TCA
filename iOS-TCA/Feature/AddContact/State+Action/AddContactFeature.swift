//
//  AddContactFeature.swift
//  iOS-TCA
//
//  Created by Imran on 16/12/23.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct AddContactFeature{
    
    struct State: Equatable{
        var contact: Contact
    }
    
    enum Action{
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action{
                
            case .cancelButtonTapped:
                return .none
            case .saveButtonTapped:
                return .none
            case let .setName(name):
                state.contact.name = name
                return .none
            }
        }
    }
}
