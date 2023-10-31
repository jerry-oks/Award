//
//  ContentView.swift
//  Award
//
//  Created by HOLY NADRUGANTIX on 31.10.2023.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State private var achievementIsUnlocked = false
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            ConfettiCannon(
                counter: $counter,
                num: 100,
                confettis: [
                    .sfSymbol(symbolName: "apple.logo"),
                    .sfSymbol(symbolName: "swift"),
                    .sfSymbol(symbolName: "command"),
                    .sfSymbol(symbolName: "iphone"),
                    .image("Swiftbook")
                ],
                confettiSize: 20,
                rainHeight: UIScreen.main.bounds.height,
                fadesOut: false,
                openingAngle: Angle(degrees: 0),
                closingAngle: Angle(degrees: 360),
                radius: UIScreen.main.bounds.width / 1.5
            )
            
            AwardView(
                size: UIScreen.main.bounds.width / 2,
                achievementIsUnlocked: $achievementIsUnlocked
            )
        }
        .onLongPressGesture {
            if counter == 0 {
                counter = 1
                achievementIsUnlocked.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
