//
//  ContacTabView.swift
//  iOS-TCA
//
//  Created by Imran on 16/12/23.
//
import ComposableArchitecture
import SwiftUI

struct ContacTabView: View {
    
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: \.conatacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        Text(contact.name)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
        .sheet(
            store: self.store.scope(
                state: \.$addContact,
                action: \.addContact
            )
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
    }
}

#Preview {
    ContacTabView(store: Store(initialState: ContactsFeature.State())  {
        ContactsFeature()
    })
}
