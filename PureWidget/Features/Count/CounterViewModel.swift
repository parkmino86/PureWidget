//
//  CounterViewModel.swift
//  PureWidget
//
//  Created by minoh.park on 10/22/24.
//

import Combine
import Foundation

@MainActor
class CounterViewModel: ObservableObject {
    @Published private(set) var count: Int = 0
    private let counterActor = CounterActor()
    private var cancellables = Set<AnyCancellable>()
    
    struct State {
        var count: Int = 0
    }
    
    actor CounterActor {
        private var state = State()
        
        func increment() {
            state.count += 1
        }
        
        func decrement() {
            state.count -= 1
        }
        
        func getCount() -> Int {
            state.count
        }
    }
    
    func increment() {
        Future { [weak self] promise in
            Task {
                await self?.counterActor.increment()
                if let newCount = await self?.counterActor.getCount() {
                    promise(.success(newCount))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .assign(to: &$count)
    }
    
    func decrement() {
        Future { [weak self] promise in
            Task {
                await self?.counterActor.decrement()
                if let newCount = await self?.counterActor.getCount() {
                    promise(.success(newCount))
                }
            }
        }
        .receive(on: DispatchQueue.main)
        .assign(to: &$count)
    }
}
