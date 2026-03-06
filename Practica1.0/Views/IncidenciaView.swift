import SwiftUI

struct IncidenciaView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        ZStack {

            // FONDO
            Color(red: 8/255, green: 36/255, blue: 64/255)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // NAVBAR PERSONALIZADO (ÚNICO)
                CustomNavBar(
                    style: .back(title: "Incidencia"),
                    onBack: { dismiss() }
                )

                // CONTENIDO
                VStack(alignment: .leading, spacing: 16) {

                    // CARD
                    VStack(alignment: .leading, spacing: 14) {

                        HStack(spacing: 10) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.yellow)
                                .font(.title3)

                            Text("Objeto encontrado")
                                .font(.headline)
                                .foregroundColor(.white)
                        }

                        Text("""
Se encontró un teléfono celular extraviado dentro de las instalaciones.

El objeto fue entregado al área de Objetos Perdidos para su resguardo.
""")
                        .foregroundColor(.white.opacity(0.9))
                        .font(.subheadline)

                        Divider()
                            .background(Color.white.opacity(0.3))

                        HStack {
                            Text("Ubicación:")
                                .foregroundColor(.white.opacity(0.7))
                            Spacer()
                            Text("Objetos Perdidos")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }

                        HStack {
                            Text("Hora:")
                                .foregroundColor(.white.opacity(0.7))
                            Spacer()
                            Text("12:45 pm")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(18)

                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true) // 👈 evita botón duplicado
    }
}

#Preview {
    IncidenciaView()
}

