//
//  ContactsFeature.swift
//  iOS-TCA
//
//  Created by Imran on 16/12/23.
//
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}


@Reducer
struct ContactsFeature{
    struct State: Equatable{
        var conatacts: IdentifiedArrayOf<Contact> = []
        //        var conatacts: [Contact]
    }
    
    enum Action{
        case addButtonTapped
    }
    
    var body: some ReducerOf<Self>{
        Reduce { state, action in
            switch action{
            case .addButtonTapped:
                return .none
            }
        }
    }
}
