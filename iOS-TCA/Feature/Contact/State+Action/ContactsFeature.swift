//
//  ContactsFeature.swift
//  iOS-TCA
//
//  Created by Imran on 16/12/23.
//
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
    
//    init(name: String) {
//        self.name = name
//    }
//    
//    
}

extension Contact{
    static let contactList:[Contact] = [
        Contact(name: "A"),
        Contact(name: "B"),
        Contact(name: "C"),
    ]
}


@Reducer
struct ContactsFeature{
    struct State: Equatable{
        @PresentationState var addContact: AddContactFeature.State?
        var conatacts: IdentifiedArrayOf<Contact> = []
//                var conatacts: [Contact]
    }
    
    enum Action{
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self>{
        Reduce { state, action in
            switch action{
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact( name: "")
                )
                return .none
            case .addContact(.presented(.cancelButtonTapped)):
                state.addContact = nil
                return .none
                
            case .addContact(.presented(.saveButtonTapped)):
                guard let contact = state.addContact?.contact
                else { return .none }
                state.conatacts.append(contact)
                state.addContact = nil
                return .none
                
                
            case .addContact:
                return .none
            
            }
        }  
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}
