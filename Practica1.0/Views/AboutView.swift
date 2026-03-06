import SwiftUI

struct AboutView: View {

    @Environment(\.dismiss) private var dismiss
    
    private let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    var body: some View {

        ZStack {
            
            primaryColor
                .ignoresSafeArea()

            VStack(spacing: 0) {

                CustomNavBar(
                    style: NavBarStyle.back(title: "Acerca de"),
                    onBack: { dismiss() }
                )

                Spacer(minLength: 40)

                VStack(spacing: 18) {

                    // Logos ULAB + ITESO
                    Image("ulab_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 85)
                        .padding(.top, 35)

                    // Logo ADME centrado
                    Image("adme_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)

                    // Versión
                    Text("Versión 3.0")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.top, 5)

                    // Texto en 3 renglones
                    VStack(spacing: 4) {
                        Text("Desarrollado por Laboratorio de")
                        Text("Aplicaciones Móviles")
                        Text("ULAB ITESO")
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)

                    Spacer()

                    // 🔹 Soporte hasta abajo
                    Text("Soporte: ulab@iteso.mx")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding(.bottom, 25)
                }
                .frame(width: 330, height: 520)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(
                    color: .black.opacity(0.12),
                    radius: 20,
                    x: 0,
                    y: 10
                )

                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        AboutView()
    }
}
