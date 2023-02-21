//
//  SmallAddButton.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50.0)
                .foregroundColor(Color(red: 52.0/255.0, green: 152.0/255.0, blue: 185.0/255.0))
            Image(systemName: "plus")
                .imageScale(.large)
                .font(.system(.body, design: .monospaced, weight: .heavy))
                .foregroundColor(Color(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0))
        }
        .frame(height: 50.0)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
