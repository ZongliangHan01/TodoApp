//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Zongliang Han on 4/2/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundcolor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundcolor)
                .rotationEffect(Angle(degrees: angle))
    
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
                
            }
            .padding(.top, 30)
        }
        
        .frame(width: UIScreen.main.bounds.width*3,
               height: 300)
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "substring", angle: 10, backgroundcolor: .pink)
}
