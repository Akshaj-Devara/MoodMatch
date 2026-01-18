//other
import Foundation
import SwiftUI

struct User: Identifiable {
    var id: String
    var name: String
    var mood: String
    var strength: Int
}

struct CenteredCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // 🔹 Full screen filler background
            Color.gray1
                .ignoresSafeArea()
            
            // 🔹 Centered card
            VStack {
                content
            }
            .frame(maxWidth: 420)
            .background(Color.jetBlack)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.4), radius: 10)
        }
    }
}


let dummyUsers = [
    User(id: "1", name: "Ava", mood: "stressed", strength: 8),
    User(id: "2", name: "Noah", mood: "anxious", strength: 6),
    User(id: "3", name: "Mia", mood: "happy", strength: 4),
    User(id: "4", name: "Leo", mood: "sad", strength: 7),
    User(id: "5", name: "Zoe", mood: "excited", strength: 9)
]

func findMatch(mood: String, strength: Int) -> User? {
    return dummyUsers.first(where: { user in
        user.mood.lowercased() == mood.lowercased() &&
        abs(user.strength - strength) <= 2
    })
}


