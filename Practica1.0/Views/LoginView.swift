import SwiftUI

struct LoginView: View {

    @State private var goToHome = false

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var keepSession: Bool = false
    @State private var showPassword: Bool = false

    let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    var body: some View {

        if goToHome {
            HomeView()
        } else {

            ZStack {

                Image("login_bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.black.opacity(0.45)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    VStack(spacing: 22) {

                        VStack(spacing: 8) {
                            Image(systemName: "person.3.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55, height: 55)
                                .foregroundColor(primaryColor)

                            Text("creative")
                                .font(.title2)
                                .fontWeight(.bold)

                            Text("your tagline goes here")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        TextField("Correo electrónico", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(Color.gray.opacity(0.12))
                            .cornerRadius(12)

                        HStack {
                            Group {
                                if showPassword {
                                    TextField("Contraseña", text: $password)
                                } else {
                                    SecureField("Contraseña", text: $password)
                                }
                            }

                            Button {
                                showPassword.toggle()
                            } label: {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.12))
                        .cornerRadius(12)

                        // BOTÓN QUE CAMBIA LA VISTA
                        PrimaryButton(title: "Ingresar") {
                            goToHome = true
                        }

                        HStack {
                            Button {
                                keepSession.toggle()
                            } label: {
                                HStack(spacing: 8) {
                                    Image(systemName: keepSession ? "checkmark.square.fill" : "square")
                                        .foregroundColor(keepSession ? primaryColor : .gray)

                                    Text("Mantener sesión activa")
                                        .font(.footnote)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }

                        VStack(spacing: 12) {

                            Button("¿Olvidaste tu contraseña?") {}
                                .font(.footnote)
                                .foregroundColor(primaryColor)

                            Button("¿Tienes problemas para ingresar?") {}
                                .font(.footnote)
                                .foregroundColor(primaryColor)

                            Button("Aviso de Privacidad") {}
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(primaryColor)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 25)
                    .frame(width: 360)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .black.opacity(0.2), radius: 15)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
