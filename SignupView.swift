import SwiftUI

struct SignupView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.gray1.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Create Account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.lightCyan)
                    
                    TextField("Enter your name", text: $name)
                        .padding()
                        .background(Color.lightCyan)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                    
                    TextField("Enter your email", text: $email)
                        .padding()
                        .background(Color.lightCyan)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                    
                    
                    SecureField("Enter your password", text: $password)
                        .padding()
                        .background(Color.lightCyan)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                    
                    NavigationLink("Create Account") {
                        MoodSelectionView(username: name)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.freshSky)
                    .foregroundColor(.jetBlack)
                    .cornerRadius(10)
                    
                    NavigationLink("Login") {
                        LoginView()
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
