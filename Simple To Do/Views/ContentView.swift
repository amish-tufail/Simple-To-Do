//
//  ContentView.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showTask: Bool = false
    @StateObject private var realmManager = RealmManager()
    let feedback = UIImpactFeedbackGenerator()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showTask = true
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.impactOccurred()
                }
        }
        .fullScreenCover(isPresented: $showTask, content: {
            AddTaskView()
                .environmentObject(realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
