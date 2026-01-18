import SwiftUI

struct MoodSelectionView: View {
    var username: String
    
    let moods = [
        ("😊", "Happy"),
        ("😥", "Sad"),
        ("😫", "Stressed"),
        ("😰", "Anxious"),
        ("😐", "Bored")
    ]
    
    @State private var selectedMood: String = ""
    @State private var strength: Double = 5
    
    var body: some View {
        ZStack {
            Color.gray1.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Choose Your Mood")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.lightCyan)
                    
                    Text("Hi \(username)")
                        .foregroundColor(.freshSky)
                    
                    ForEach(moods, id: \.1) { mood in
                        Button(action: {
                            selectedMood = mood.1
                        }) {
                            HStack {
                                Text(mood.0)
                                Text(mood.1)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedMood == mood.1 ? Color.frenchBlue : Color.yaleBlue)
                            .foregroundColor(.lightCyan)
                            .cornerRadius(10)
                        }
                    }
                    
                    Text("Strength: \(Int(strength))/10")
                        .foregroundColor(.lightCyan)
                    
                    Slider(value: $strength, in: 1...10, step: 1)
                        .accentColor(.freshSky)
                    
                    NavigationLink("Find Match") {
                        MatchView(selectedMood: selectedMood, strength: Int(strength))
                    }
                    .disabled(selectedMood == "")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedMood == "" ? Color.yaleBlue : Color.freshSky)
                    .foregroundColor(.jetBlack)
                    .cornerRadius(10)
                    
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
