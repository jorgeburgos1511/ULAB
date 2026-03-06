import SwiftUI

// MARK: - Model
struct FAQItem: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

// MARK: - View
struct FAQView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var expandedID: UUID? = nil

    private let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    let faqs: [FAQItem] = [
        FAQItem(
            question: "1. Anfitrión no puede descargar/instalar la aplicación",
            answer: """
Revisar que el sistema operativo del celular sea compatible.

iOS:
• Versión mínima: 14
• No compatible: iPhone 5 y anteriores

Android:
• Versión mínima: 7 (API 24)
• Versión máxima: 14 (API 34)

No compatible:
• Harmony OS

Espacio requerido:
• iOS: 7 MB (13 MB adicionales para TestFlight)
• Android: 50 MB
"""
        ),
        FAQItem(
            question: "2. Anfitrión no cuenta con celular compatible con la aplicación",
            answer: "Se le asignará a un área distinta a la lectura de QRs."
        ),
        FAQItem(
            question: "3. Anfitrión no puede iniciar sesión",
            answer: """
Las credenciales requeridas son las del ITESO.
Debe haberse registrado previamente.
"""
        ),
        FAQItem(
            question: "4. Anfitrión cuyo celular dejó de estar disponible durante el evento",
            answer: "Avisar en el grupo de WhatsApp Staff ITESO."
        ),
        FAQItem(
            question: "5. Anfitrión cuyo celular no cuente con conexión a internet",
            answer: "Usar datos celulares. Consumo menor a 100 MB."
        ),
        FAQItem(
            question: "6. Alumnos visitantes cuyo celular tenga la batería agotada",
            answer: "Enviar al Staff Vive ITESO para registro manual."
        ),
        FAQItem(
            question: "7. La aplicación no muestra información",
            answer: """
Revisar conexión.
Verificar fecha y hora.
Avisar al equipo Vive ITESO.
"""
        )
    ]

    var body: some View {

        ZStack {

            primaryColor
                .ignoresSafeArea()

            VStack(spacing: 0) {

                CustomNavBar(
                    style: .back(title: "FAQ"),
                    onBack: { dismiss() }
                )

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(faqs) { item in
                            FAQRow(
                                item: item,
                                isExpanded: expandedID == item.id
                            ) {
                                withAnimation(.easeInOut) {
                                    expandedID = expandedID == item.id ? nil : item.id
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

// MARK: - FAQ Row
struct FAQRow: View {

    let item: FAQItem
    let isExpanded: Bool
    let onTap: () -> Void

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Button(action: onTap) {

                HStack(alignment: .top) {

                    Text(item.question)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                }
            }

            if isExpanded {
                Text(item.answer)
                    .foregroundColor(.white.opacity(0.9))
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
            }

            Divider()
                .background(Color.white.opacity(0.3))
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    FAQView()
}

