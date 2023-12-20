//
//  ContentView.swift
//  iOS-TCA
//
//  Created by Imran on 13/12/23.
//

import ComposableArchitecture
import SwiftUI
 
struct ContentView: View {
    
    let store: StoreOf<CounterFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                VStack {
                    Text("\(viewStore.count)")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    HStack {
                        Button("-") {
                            viewStore.send(.decrementButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        
                        
                        Button("+") {
                            viewStore.send(.incrementButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                
                /*
                Button(viewStore.isTimeRunning ? "Stop timer" : "Start timer") {
                    viewStore.send(.toggleButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                */
                
                Button("Fact") {
                    viewStore.send(.numberFactButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                
                
                if viewStore.isLoading {
                    ProgressView()
                } else if let fact = viewStore.numberFactAlert {
                    Text(fact)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            /*
            .alert(
                item: viewStore.binding(
                    get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
                    send: .factAlertDismissed
                ),
                content: { Alert(title: Text($0.title)) }
            )*/
        }
    }
}

#Preview {
    ContentView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}

struct FactAlert: Identifiable {
    var title: String
    var id: String { self.title }
}
