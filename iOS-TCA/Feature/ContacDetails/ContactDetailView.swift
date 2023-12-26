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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                Button("Delete") {
                    viewStore.send(.deleteButtonTapped)
                }
            }
            .navigationBarTitle(Text(viewStore.contact.name))
        }
        .alert(store: self.store.scope(state: \.$alert, action: \.alert))
    }
}

#Preview {
    NavigationStack{
        ContactDetailView(store: .init(initialState: ContactDetailFeature.State(contact: .init(name: "Game")), reducer: {
            ContactDetailFeature()
        }))
    }
}
