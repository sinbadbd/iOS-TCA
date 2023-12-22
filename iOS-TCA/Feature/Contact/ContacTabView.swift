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
                        HStack {
                            Text(contact.name)
                            Spacer()
                            Button {
                                viewStore.send(.deleteButtonTapped(id: contact.id))//(id: contact.id))
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
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
                state: \.$destination.addContact,
                action: \.destination.addContact
            )
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
        .alert(
            store: self.store.scope(
                state: \.$destination.alert,
                action: \.destination.alert
            )
        )
        /*
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
        .alert(store: self.store.scope(
            state: \.$alert,
            action: \.alert
        )
        )*/
    }
}

#Preview {
    ContacTabView(store: Store(initialState: ContactsFeature.State())  {
        ContactsFeature()
    })
}
