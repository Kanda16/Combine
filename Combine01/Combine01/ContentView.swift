//
//  ContentView.swift
//  Combine01
//
//  Created by cmStudent on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ContentViewModel
        
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
        
    var body: some View {
        NavigationView{
            VStack {
                if(viewModel.timeS>9){
                    Text("\(viewModel.timeM):\(viewModel.timeS)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }else{
                    Text("\(viewModel.timeM):0\(viewModel.timeS)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                HStack{
                    Button("スタート") {
                        viewModel.startCounting()
                    }
                    .disabled(viewModel.isTimerRunning)
                    
                    Button("ストップ") {
                        viewModel.stopCounting()
                    }
                    .disabled(!viewModel.isTimerRunning)
                    .padding()
                }
                        
                Button("リセット") {
                    viewModel.resetCount()
                }
                .padding(.bottom)
                
                NavigationLink(destination:settingView()){
                    Text("タイマーセット")
                        .disabled(viewModel.isTimerRunning)
                        .padding(.bottom)
                }
                .onAppear{
                    viewModel.set()
                }
                
                NavigationLink(destination:StopWatchView(stopWatchViewModel: StopWatchViewModel())){
                    Text("ストップウォッチ")
                        .padding(.bottom)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
