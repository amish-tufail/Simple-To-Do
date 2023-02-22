//
//  TaskView.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject private var realmManager: RealmManager
    let feedback = UIImpactFeedbackGenerator()
    var body: some View {
        VStack {
            Text("My Tasks")
                .font(.system(.title, design: .monospaced, weight: .bold))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            List {
                if realmManager.tasks.count == 0 {
                    Text("")
                        .listRowBackground(Color.clear)
                }
                ForEach(realmManager.tasks, id: \.id) { task in
                    if !task.isInvalidated { // This solves the object deleted issue
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                                if task.completed {
                                    playSound(sound: "sound-rise", type: "mp3")
                                } else {
                                    playSound(sound: "sound-tap", type: "mp3")
                                }
                                feedback.impactOccurred()
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    realmManager.deleteTask(id: task.id)
                                    feedback.impactOccurred()
                                } label: {
                                    Label("Delete", systemImage: "xmark.circle")
                                }
                                
                            }
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color(red: 232.0/255.0, green: 213.0/255.0, blue: 196.0/255.0))
            }
//            .background(.clear)
            .scrollContentBackground(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
        )
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}

// UI
