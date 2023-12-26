//
//  ContactDetailView.swift
//  iOS-TCA
//
//  Created by Imran on 26/12/23.
//

import ComposableArchitecture
import SwiftUI

struct ContactDetailView: View {
    
    var store: StoreOf<ContactDetailFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Form {
            }
            .navigationBarTitle(Text(viewStore.contact.name))
        }
    }
}

#Preview {
    NavigationStack{
        ContactDetailView(store: .init(initialState: ContactDetailFeature.State(contact: .init(name: "Game")), reducer: {
            ContactDetailFeature()
        }))
    }
}
