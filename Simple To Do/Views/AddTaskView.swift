//
//  AddTaskView.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @State private var animate: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Image("ToDo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400.0, height: 400.0)
                    .opacity(animate ? 1.0 : 0.0)
                    .offset(y: animate ? 0.0 : 900.0)
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Create a new task")
                        .font(.system(.title2, design: .monospaced, weight: .bold))
                        .opacity(animate ? 1.0 : 0.0)
                        .offset(y: animate ? 0.0 : 600.0)
                    RoundedRectangle(cornerRadius: 2.0, style: .continuous)
                        .frame(width: 230.0, height: 2.0)
                        .padding(.top, -15.0)
                    TextField("Enter your task", text: $title)
                        .font(.system(.body, design: .monospaced, weight: .thin))
                        .padding(10.0)
                        .background(
                            Color(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0)
                        )
                        .cornerRadius(12.0)
                        .opacity(animate ? 1.0 : 0.0)
                        .offset(y: animate ? 0.0 : 600.0)
                    Button {
                        print("task added")
                    } label: {
                        Text("Add Task")
                            .font(.system(.body, design: .monospaced, weight: .semibold))
                            .padding()
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                                    .fill(Color(red: 52.0/255.0, green: 152.0/255.0, blue: 185.0/255.0))
                            )
                            .foregroundColor(Color(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0))
                    }
                    .opacity(animate ? 1.0 : 0.0)
                    .offset(y: animate ? 0.0 : 600.0)
                }
                .padding()
                .padding(.horizontal)
                .background(
                    RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                        .fill(Color(red: 232.0/255.0, green: 213.0/255.0, blue: 196.0/255.0))
                )
                .padding()
                .opacity(animate ? 1.0 : 0.0)
                .offset(y: animate ? 0.0 : 600.0)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
        )
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                animate = true
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
