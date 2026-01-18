import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool
}

struct ChatBubble: View {
    let message: ChatMessage
    
    var body: some View {
        Text(message.text)
            .padding()
            .background(message.isCurrentUser ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(16)
            .frame(maxWidth: 280, alignment: message.isCurrentUser ? .trailing : .leading)
            .padding(message.isCurrentUser ? .leading : .trailing, 60)
    }
}

struct ChatView: View {
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Hi! How are you feeling today?", isCurrentUser: false)
    ]
    
    @State private var input = ""
    @State private var showVideo = false
    @State private var videoURL: URL? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack(spacing: 20) {
                    Text("Chat")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(messages) { message in
                                HStack {
                                    if message.isCurrentUser { Spacer() }
                                    ChatBubble(message: message)
                                    if !message.isCurrentUser { Spacer() }
                                }
                            }
                        }
                        .padding()
                    }
                    
                    HStack {
                        TextField("Type a message...", text: $input)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        Button("Send") {
                            if !input.isEmpty {
                                messages.append(ChatMessage(text: input, isCurrentUser: true))
                                
                                let feeling = input.lowercased()
                                let url = getVideoURL(for: feeling)
                                
                                messages.append(ChatMessage(text: "Thanks for sharing. Here's a video for you!", isCurrentUser: false))
                                
                                videoURL = url
                                showVideo = true
                                
                                input = ""
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    
                    Spacer()
                }
                .padding()
                .frame(maxWidth: 420, maxHeight: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.4), radius: 10)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showVideo) {
            if let url = videoURL {
                VideoView(videoURL: url)
            }
        }
    }
    
    func getVideoURL(for feeling: String) -> URL {
        if feeling.contains("sad") {
            return URL(string: "https://www.youtube.com/watch?v=PppkNH3bKV4")!
        } else if feeling.contains("stressed") {
            return URL(string: "https://www.youtube.com/watch?v=4Tm6Z1y3h94")!
        } else if feeling.contains("anxious") {
            return URL(string: "https://www.youtube.com/watch?v=4Tm6Z1y3h94")!
        } else if feeling.contains("happy") {
            return URL(string: "https://www.youtube.com/watch?v=3GwjfUFyY6M")!
        } else {
            return URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
        }
    }
}

struct VideoView: View {
    let videoURL: URL
    
    var body: some View {
        VStack {
            Text("Here’s a video for you 😊")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
            
            Spacer()
            
            Link("Watch Video", destination: videoURL)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            
            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
