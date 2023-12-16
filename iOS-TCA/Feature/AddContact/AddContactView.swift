//
//  AddContactView.swift
//  iOS-TCA
//
//  Created by Imran on 16/12/23.
//
import ComposableArchitecture
import SwiftUI

struct AddContactView: View {
    
    let store:StoreOf<AddContactFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form{
                TextField("Name", text: viewStore.binding(get: \.contact.name, send: {.setName($0)}))
                Button("Save"){
                    viewStore.send(.saveButtonTapped)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Cancel") {
                        viewStore.send(.cancelButtonTapped)
                    }
                }
            }
        }
    }
}

#Preview {
    AddContactView(store: Store(initialState: AddContactFeature.State(contact: Contact.init(name: "ddd")), reducer: {
        AddContactFeature()
    }))
}
