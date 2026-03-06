import SwiftUI

struct ProfileView: View {

    @Environment(\.dismiss) private var dismiss

    // Navegaciones futuras
    @State private var goToPassword = false
    @State private var goToNotifications = false
    @State private var goToDisplay = false
    @State private var goToPermissions = false
    @State private var goToAbout = false
    @State private var goToSupport = false

    var body: some View {

        ZStack {

            Color(red: 10/255, green: 44/255, blue: 74/255)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // NAVBAR
                HStack {

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title3)
                    }

                    Spacer()

                    Text("Mi perfil")
                        .foregroundColor(.white)
                        .font(.headline)

                    Spacer()

                    Button {
                        goToSupport = true
                    } label: {
                        Text("Soporte")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                }
                .padding()
                .padding(.top, 10)

                ScrollView {

                    VStack(spacing: 25) {

                        // USER CARD
                        HStack(spacing: 16) {

                            Image("profile_placeholder") // puedes cambiar luego
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 4) {

                                Text("Francisco José Aguilar Morales")
                                    .foregroundColor(.white)
                                    .font(.headline)

                                Text("franciscoaguilar@iteso.mx")
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.subheadline)

                                Text("Anfitrión")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.caption)
                            }

                            Spacer()
                        }
                        .padding()
                        .background(Color(red: 7/255, green: 32/255, blue: 55/255))
                        .cornerRadius(20)
                        .padding(.horizontal)

                        // OPTIONS
                        VStack(spacing: 22) {

                            ProfileRow(icon: "gearshape.fill", title: "Contraseña") {
                                goToPassword = true
                            }

                            ProfileRow(icon: "bell.fill", title: "Notificaciones") {
                                goToNotifications = true
                            }

                            ProfileRow(icon: "eye.fill", title: "Visualización") {
                                goToDisplay = true
                            }

                            ProfileRow(icon: "lock.fill", title: "Permisos") {
                                goToPermissions = true
                            }

                            ProfileRow(icon: "info.circle.fill", title: "Acerca de") {
                                goToAbout = true
                            }
                        }
                        .padding(.horizontal)

                        // LOGOUT BUTTON
                        Button {
                            print("Cerrar sesión")
                        } label: {
                            Text("Cerrar sesión")
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(14)
                        }
                        .padding(.horizontal, 60)
                        .padding(.top, 10)
                    }
                    .padding(.top, 20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)

        // DESTINOS FUTUROS (placeholders)
        .navigationDestination(isPresented: $goToPassword) {
            Text("Pantalla Contraseña")
        }
        .navigationDestination(isPresented: $goToNotifications) {
            Text("Pantalla Notificaciones")
        }
        .navigationDestination(isPresented: $goToDisplay) {
            Text("Pantalla Visualización")
        }
        .navigationDestination(isPresented: $goToPermissions) {
            Text("Pantalla Permisos")
        }
        .navigationDestination(isPresented: $goToAbout) {
            AboutView()
        }
        .navigationDestination(isPresented: $goToSupport) {
            Text("Pantalla Soporte")
        }
    }
}

//
// MARK: - Profile Row
//

struct ProfileRow: View {

    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 16) {

                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.25))
                        .frame(width: 40, height: 40)

                    Image(systemName: icon)
                        .foregroundColor(.white)
                }

                Text(title)
                    .foregroundColor(.white)
                    .font(.subheadline)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
}

#Preview {
    ProfileView()
}

