//
//  StopWatchView.swift
//  Combine01
//
//  Created by cmStudent on 2023/01/20.
//

import SwiftUI

struct StopWatchView: View {
    @ObservedObject private var stopWatchViewModel: StopWatchViewModel
    
    init(stopWatchViewModel: StopWatchViewModel) {
        self.stopWatchViewModel = stopWatchViewModel
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("\(stopWatchViewModel.count)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                HStack{
                    Button("スタート") {
                        stopWatchViewModel.startCounting()
                    }
                    .disabled(stopWatchViewModel.isTimerRunning)
                    
                    Button("ストップ") {
                        stopWatchViewModel.stopCounting()
                    }
                    .disabled(!stopWatchViewModel.isTimerRunning)
                    .padding()
                }
                
                Button("リセット") {
                    stopWatchViewModel.resetCount()
                }
            }
        }
    }
}

struct StopWatchtView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView(stopWatchViewModel: StopWatchViewModel())
    }
}
