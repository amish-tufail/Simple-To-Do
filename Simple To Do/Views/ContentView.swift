//
//  ContentView.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showTask: Bool = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showTask = true
                }
        }
        .fullScreenCover(isPresented: $showTask, content: {
            AddTaskView()
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
