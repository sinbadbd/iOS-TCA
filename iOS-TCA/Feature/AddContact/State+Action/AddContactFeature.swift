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
        case delegate(Delegate)
        case saveButtonTapped
        case setName(String)
        
        enum Delegate: Equatable {
           // case cancel
            case saveContact(Contact)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action{
                
            case .cancelButtonTapped:
//                return .send(.delegate(.cancel)) // old
                return .run { _ in await self.dismiss() } // new
                
            case .saveButtonTapped:
                //return .send(.delegate(.saveContact(state.contact)))
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
                
            case let .setName(name):
                state.contact.name = name
                return .none
                
            case .delegate(_):
                return .none
            }
        }
    }
}
