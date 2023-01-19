//
//  ContentViewModel.swift
//  Combine01
//
//  Created by cmStudent on 2023/01/18.
//

import Foundation
import SwiftUI
import Combine

final class ContentViewModel: ObservableObject {
    @Published var timeM = 0
    @Published var timeS = 0
    @Published var isTimerRunning = false
//    @State var showSeet=false
    
    @AppStorage("setTimeM") var setTimeM="5"
    @AppStorage("setTimeS") var setTimeS="30"
    
    private var cancellable: AnyCancellable?
    
    init(){
        set()
    }
    
    func set(){
        timeM=Int(setTimeM)!
        timeS=Int(setTimeS)!
    }
    
    func startCounting() {
        isTimerRunning = true
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if(self.timeS==0){
                    
                    if(self.timeM==0){
                        self.stopCounting()
//                        self.showSeet=true
                    }else{
                        self.timeM -= 1
                        self.timeS = 59
                    }
                }else{
                    self.timeS -= 1
                }

            }
    }
    
    func stopCounting() {
        isTimerRunning = false
        cancellable?.cancel()
    }
    
    func resetCount() {
        timeM=Int(setTimeM)!
        timeS=Int(setTimeS)!
    }
}

