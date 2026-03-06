import SwiftUI

struct NotificationsView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var selectedTab: String = "Programa"

    private let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    var body: some View {

        ZStack {

            primaryColor
                .ignoresSafeArea()

            VStack(spacing: 0) {

                CustomNavBar(
                    style: .back(title: "Notificaciones"),
                    onBack: { dismiss() }
                )

                ScrollView {

                    VStack(alignment: .leading, spacing: 20) {

                        // MARK: - Tabs
                        HStack(spacing: 12) {

                            notificationTab("Programa")
                            notificationTab("Talleres")
                            notificationTab("Conferencias")
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)

                        // MARK: - Notificaciones
                        VStack(spacing: 18) {

                            notificationCard(
                                "La conferencia Liderazgo y Emprendimiento: Construyendo un Futuro Exitoso esta iniciando."
                            )

                            notificationCard(
                                "Se pospuso 1 hora la comida."
                            )

                            notificationCard(
                                "Tus datos han sido verificados."
                            )

                            notificationCard(
                                "Bienvenido a Adme 3.0"
                            )
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    // MARK: - Tab Button
    private func notificationTab(_ title: String) -> some View {

        Button {
            selectedTab = title
        } label: {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(selectedTab == title ? primaryColor : .black)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(
                    selectedTab == title ? Color.white : Color.white.opacity(0.9)
                )
                .cornerRadius(12)
        }
    }

    // MARK: - Notification Card
    private func notificationCard(_ text: String) -> some View {

        Text(text)
            .font(.body)
            .foregroundColor(.black)
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(20)
    }
}

#Preview {
    NotificationsView()
}

