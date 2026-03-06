import SwiftUI

struct SelectAssistantView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""

    let assistants = [
        "Francisco José Aguilar Morales",
        "Laura Daniela Lopez Tarzo",
        "Ruben Alejandro Diaz",
        "Roberto Lopez Dia",
        "Ernesto Vazquez"
    ]

    var filteredAssistants: [String] {
        if searchText.isEmpty {
            return assistants
        }
        return assistants.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {

        ZStack {

            // fondo
            AppTheme.itesoBlue
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // NAVBAR
                CustomNavBar(
                    style: .back(title: "Actividades"),
                    onBack: { dismiss() }
                )

                // CONTENIDO
                ScrollView {
                    VStack(spacing: 22) {

                        // SEARCH
                        HStack(spacing: 8) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)

                            TextField("Buscar", text: $searchText)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.horizontal)

                        // STATS
                        HStack {
                            statItem(title: "Asistentes", value: "0")

                            Divider()
                                .background(Color.white.opacity(0.3))

                            statItem(title: "Inscritos", value: "110")

                            Divider()
                                .background(Color.white.opacity(0.3))

                            statItem(title: "Cupo", value: "123")
                        }
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)

                        // SUBTÍTULO
                        Text("Elegir asistente")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)

                        // LISTA
                        VStack(spacing: 16) {
                            ForEach(filteredAssistants, id: \.self) { name in
                                VStack(alignment: .leading, spacing: 10) {

                                    Text(name)
                                        .foregroundColor(.white)

                                    Divider()
                                        .background(Color.white.opacity(0.3))
                                }
                            }
                        }
                        .padding(.horizontal)

                        Spacer(minLength: 40)
                    }
                    .padding(.top, 20)
                }

                // bottom bar
                BottomBar(
                    onFAQTap: { },
                    onChatTap: { },
                    onIncidenciaTap: { }
                )
            }
        }
    }

    // MARK: - Stat Item
    func statItem(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .font(.caption)

            Text(value)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SelectAssistantView()
}
