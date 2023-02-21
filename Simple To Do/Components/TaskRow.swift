//
//  TaskRow.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
        }
        .font(.system(.body, design: .monospaced, weight: .regular))
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do Laundry", completed: true)
    }
}
