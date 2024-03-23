//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI

struct TLButton: View {
    let text: String
    let backgroundcolor: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundcolor)
                Text(text)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 30)
    }
}

#Preview {
    TLButton(text: "text", backgroundcolor: .blue) {
        
    }
}
