//
//  StopWatchViewModel.swift
//  Combine01
//
//  Created by cmStudent on 2023/01/20.
//

import Foundation
import Combine

final class StopWatchViewModel: ObservableObject {
    @Published var count = 0
    @Published var isTimerRunning = false
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.count += 1
            }
    }
    
    func stopCounting() {
        isTimerRunning = false
        cancellable?.cancel()
    }
    
    func resetCount() {
        count = 0
    }
}
