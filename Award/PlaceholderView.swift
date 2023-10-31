//
//  PlaceholderView.swift
//  Award
//
//  Created by HOLY NADRUGANTIX on 31.10.2023.
//

import SwiftUI

struct PlaceholderView: View {
    let size: Double
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.width)
            let middle = size / 2
                        
            Path { path in
                path.addArc(
                    center: CGPoint(x: 0, y: 0),
                    radius: middle,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: size, y: 0),
                    radius: middle,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: size, y: size),
                    radius: middle,
                    startAngle: .degrees(270),
                    endAngle: .degrees(180),
                    clockwise: true
                )
                path.addArc(
                    center: CGPoint(x: 0, y: size),
                    radius: middle,
                    startAngle: .degrees(0),
                    endAngle: .degrees(270),
                    clockwise: true
                )
                
            }
            .stroke(.background, lineWidth: size / 20)
            
            Image(systemName: "questionmark")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.background)
                .bold()
                .frame(width: size, height: size)
                .scaleEffect(0.25)
        }
        .scaleEffect(0.9)
    }
}


#Preview {
    PlaceholderView(size: 200)
}
