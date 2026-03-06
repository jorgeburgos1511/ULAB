import SwiftUI

struct ChatView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var messageText: String = ""

    private let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    struct ChatMessage: Identifiable {
        let id = UUID()
        let text: String
        let isFromMe: Bool
    }

    let messages: [ChatMessage] = [
        ChatMessage(text: "Hola, ¿ya estás en el auditorio?", isFromMe: false),
        ChatMessage(text: "Sí, ya llegué hace unos minutos.", isFromMe: true),
        ChatMessage(text: "Perfecto, en 5 minutos comenzamos.", isFromMe: false),
        ChatMessage(text: "Va, gracias.", isFromMe: true)
    ]

    var body: some View {

        ZStack {

            primaryColor
                .ignoresSafeArea()

            VStack(spacing: 0) {

                CustomNavBar(
                    style: .back(title: "Chat"),
                    onBack: { dismiss() }
                )

                ScrollView {
                    VStack(spacing: 14) {

                        ForEach(messages) { message in
                            HStack {

                                if message.isFromMe {
                                    Spacer()
                                }

                                Text(message.text)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(
                                        message.isFromMe
                                        ? Color.blue
                                        : Color(red: 24/255, green: 163/255, blue: 170/255)
                                    )
                                    .cornerRadius(16)
                                    .frame(maxWidth: 260, alignment: message.isFromMe ? .trailing : .leading)

                                if !message.isFromMe {
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }

                // Input
                HStack {

                    TextField("Escribe algo...", text: $messageText)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)

                    Button {
                        // Acción enviar
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 24/255, green: 163/255, blue: 170/255))
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    ChatView()
}

