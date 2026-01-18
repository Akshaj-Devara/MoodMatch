
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.gray1.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("MoodMatch")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.lightCyan)
                    
                    TextField("Enter Your Email", text: $email)
                        .padding()
                        .background(Color.lightCyan)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.lightCyan)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    
                    NavigationLink("Login") {
                        MoodSelectionView(username: "User")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.freshSky)
                    .foregroundColor(.jetBlack)
                    .cornerRadius(10)
                    
                    NavigationLink("Signup") {
                        SignupView()
                    }
                    .foregroundColor(.lightCyan)
                    
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
