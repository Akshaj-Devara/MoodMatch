import SwiftUI

struct MatchView: View {
    var selectedMood: String
    var strength: Int
    
    var matchedUser: User? {
        findMatch(mood: selectedMood, strength: strength)
    }
    
    var body: some View {
        ZStack {
            Color.gray1.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Finding a match...")
                        .font(.title2)
                        .foregroundColor(.lightCyan)
                    
                    if let user = matchedUser {
                        Text("Match Found!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.freshSky)
                        
                        Text("\(user.name) is also feeling \(user.mood)")
                            .foregroundColor(.lightCyan)
                        
                        Text("Strength: \(strength)/10")
                            .foregroundColor(.freshSky)
                        
                        NavigationLink("Connect with \(user.name)") {
                            ChatView()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.frenchBlue)
                        .foregroundColor(.lightCyan)
                        .cornerRadius(12)
                        
                    } else {
                        Text("No matches found yet.")
                            .foregroundColor(.freshSky)
                        
                        NavigationLink("Chat with Bot instead") {
                            ChatView()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.frenchBlue)
                        .foregroundColor(.lightCyan)
                        .cornerRadius(12)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 420, maxHeight: .infinity)
                .background(Color.jetBlack)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.4), radius: 10)
                
                Spacer()
            }
        }
    }
}
