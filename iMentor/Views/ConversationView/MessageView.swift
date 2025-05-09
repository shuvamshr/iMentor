//
//  MessageView.swift
//  iMentor
//
//  Created by Shuvam Shrestha on 2/5/2025.
//

import SwiftUI

struct MessageView: View {
    
    var conversation: Conversation
    
    @State private var userMessage: String = ""
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(conversation.messages) { message in
                MessageBubble(message: message)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .padding(.horizontal, 16)
            }
        }
        .listStyle(.plain)
        .navigationTitle(conversation.mentor.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    modelContext.delete(conversation)
                    dismiss()
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundStyle(.red)
                }
            }
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Enter a message", text: $userMessage)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        Task {
                            await sendMessage()
                        }
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundStyle(Color.accentColor)
                            .font(.title2)
                    }
                }
                .padding(.horizontal)
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
    }
    
    private func sendMessage() async {
        let newMessage = Message(author: .user, content: userMessage)
        
        conversation.messages.append(newMessage)
        
        // getResponse()
        
        await getGeminiResponse()
        
        userMessage = ""
    }
    
    private func getResponse() {
        
        var response: String = ""
        
        switch(userMessage) {
        case "Hello": response = "Hey, how are you doing?"
        case "I need help": response = "What help do you need with?"
        default: response = "Sorry, I don't understand"
        }
        
        let newResponse = Message(author: .mentor, content: response)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            conversation.messages.append(newResponse)
        }
    }
    
    private func getGeminiResponse() async {
        let apiKey = "AIzaSyDVgIDzam1mlXSWsyrXriN-WfMx719LYJw"
        
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=\(apiKey)") else { return }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let generationData = GenerationData(
            generationConfig: GenerationConfig(
                temperature: 1.0,
                topP: 0.95,
                topK: 64,
                maxOutputTokens: 65536,
                responseMimeType: "text/plain"
            ),
            contents: [
                Content(
                    role: "user",
                    parts: [
                        Part(text: "\(userMessage)")
                    ]
                )
            ],
            systemInstruction: SystemInstruction(
                role: "user",
                parts: [
                    Part(text: "You are a mentor named \(conversation.mentor.name), expert in \(conversation.mentor.department) who replies in only 2 sentences, and if I ask anything irrelevant reply, with \"Sorry, I don't understand\"")
                ]
            )
        )
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(generationData)
        } catch {
            print("Error encoding data")
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
            if let error = error {
                return
            }
            
            guard let data = data else { return }
            
            do {
                let geminiResponse = try JSONDecoder().decode(GeminiResponse.self, from: data)
                DispatchQueue.main.async {
                    
                    
                    let newResponse = Message(author: .mentor, content: geminiResponse.candidates[0].content.parts[0].text)
                    
                    conversation.messages.append(newResponse)
                }
            } catch {
                print("Error decoding data")
            }
        }
        
        task.resume()
    }
    
    
}


