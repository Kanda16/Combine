//
//  settingView.swift
//  Combine01
//
//  Created by cmStudent on 2023/01/19.
//

import SwiftUI
import Combine

struct settingView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("setTimeM") var setTimeM="5"
    @AppStorage("setTimeS") var setTimeS="00"
    private let maxTime = 2
    var body: some View {
        VStack{
            Text("タイマーをセット")
            HStack{
                Spacer()
                TextField("Placeholder", text:$setTimeM)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 50)
                    .onReceive(Just($setTimeM)) { _ in
                            if setTimeM.count > maxTime {
                                setTimeM = String(setTimeM.prefix(maxTime))
                            }
                        }
                Text(":")
                TextField("Placeholder", text:$setTimeS)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: 50)
                    .onReceive(Just($setTimeS)) { _ in
                            if setTimeS.count > maxTime {
                                setTimeS = String(setTimeS.prefix(maxTime))
                            }
                        }

                Spacer()
            }
            Button("戻る") {
                dismiss()
                
            }
        }
    }
}

struct settingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}
