//
//  ContactDetailFeature.swift
//  iOS-TCA
//
//  Created by Imran on 26/12/23.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ContactDetailFeature{
    
    struct State: Equatable{
        var contact: Contact
    }
    
    enum Action{
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}
