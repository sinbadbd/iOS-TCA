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
       // @PresentationState var addContact: AddContactFeature.State?
        //@PresentationState var alert: AlertState<Action.Alert>?
        var conatacts: IdentifiedArrayOf<Contact> = []
        @PresentationState var destination: Destination.State?
        var path = StackState<ContactDetailFeature.State>()
    }
    
    enum Action{
        case addButtonTapped
        //case addContact(PresentationAction<AddContactFeature.Action>)
        //case alert(PresentationAction<Alert>)
        case deleteButtonTapped(id: Contact.ID)
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<ContactDetailFeature.State, ContactDetailFeature.Action>)
        enum Alert: Equatable{
            case confirmDelete(id: Contact.ID)
        }
    }
    
    var body: some ReducerOf<Self>{
        Reduce { state, action in
            switch action{
            case .addButtonTapped:
                state.destination = .addContact(
                    AddContactFeature.State(
                        contact: Contact(name: "")
                    )
                )
                return .none
          /*
            case .addContact:
                return .none
              */
            case let .deleteButtonTapped(id: id):
                state.destination = .alert(
                    AlertState {
                        TextState("Are you sure?")
                    } actions: {
                        ButtonState(role: .destructive, action: .confirmDelete(id: id)) {
                            TextState("Delete")
                        }
                    }
                )
                return .none
                
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                state.conatacts.append(contact)
                return .none
                
                
            case let .destination(.presented(.alert(.confirmDelete(id: id)))):
                state.conatacts.remove(id: id)
                return .none
                
            case .destination:
                return .none
                
                
            case let .path(.element(id: id, action: .delegate(.confirmDeletion))):
                guard let detailState = state.path[id: id]
                else { return .none }
                state.conatacts.remove(id: detailState.contact.id)
                return .none
                
                
            case .path:
                return .none
                /*
                 case .addContact(.presented(.delegate(.cancel))):
                 state.addContact = nil
                 return .none
                 */
                //            case .addContact(.presented(.delegate(.saveContact(conatacts)))): // old
                /* case let .addContact(.presented(.delegate(.saveContact(contact)))): // new
                 /*guard let contact = state.addContact?.contact
                  else { return .none }*/
                 state.conatacts.append(contact)
                 state.addContact = nil
                 return .none
                 */
                /*
            case let .alert(.presented(.confirmDelete(id: id))):
                state.conatacts.remove(id: id)
                return .none
                
                
            case .alert:
                return .none*/
            }
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination()
        }
        .forEach(\.path, action: \.path) {
            ContactDetailFeature()
        }
        /*
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
        .ifLet(\.$alert, action: \.alert)*/
    }
}
