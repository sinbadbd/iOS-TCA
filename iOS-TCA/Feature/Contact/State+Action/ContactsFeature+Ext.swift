//
//  ContactsFeature+Ext.swift
//  iOS-TCA
//
//  Created by Imran on 22/12/23.
//

import ComposableArchitecture
import SwiftUI

extension ContactsFeature{
    
    @Reducer
    struct Destination{
        
        enum State: Equatable{
            case addContact(AddContactFeature.State)
            case alert(AlertState<ContactsFeature.Action.Alert>)
        }
        
        enum Action{
            case addContact(AddContactFeature.Action)
            case alert(ContactsFeature.Action.Alert)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: \.addContact, action: \.addContact) {
                AddContactFeature()
            }
        }
    }
}
