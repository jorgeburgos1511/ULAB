import SwiftUI

struct ActivityDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var goToFAQ = false
    @State private var goToChat = false
    @State private var goToIncidencia = false
    
    var body: some View {
        ZStack {
            
            AppTheme.itesoBlue
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                CustomNavBar(
                    style: .back(title: "Actividades"),
                    onBack: { dismiss() }
                )
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image("robotica")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .clipped()
                            .cornerRadius(12)
                        
                        Text("Robótica y Automatización: Creando el Futuro")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("En este taller, construirás y programarás un pequeño robot utilizando herramientas de automatización. Ideal para estudiantes y entusiastas de la tecnología que desean explorar el mundo de la robótica.")
                            .foregroundColor(.white.opacity(0.92))
                            .font(.system(size: 11.5, weight: .regular))
                            .lineSpacing(1.5)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 2)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            infoRow(
                                label: "Ponente",
                                value: "Ing. Javier Torres, Especialista en Robótica Industrial",
                                underlined: true,
                                italic: true
                            )
                            
                            infoRow(
                                label: "Horario",
                                value: "16:00 a 18:00 hrs"
                            )
                            
                            infoRow(
                                label: "Lugar",
                                value: "Laboratorio de robótica",
                                underlined: true,
                                italic: true
                            )
                            
                            infoRow(
                                label: "Cupo",
                                value: "110/123",
                                highlight: true
                            )
                        }
                        .padding(.top, 2)
                        
                        VStack(spacing: 12) {
                            actionButton(title: "Registrar asistencia")
                            actionButton(title: "Asistencia manual")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 14)
                        
                        Spacer(minLength: 16)
                    }
                    .padding(.horizontal, 22)
                    .padding(.top, 10)
                    .padding(.bottom, 16)
                }
                
                BottomBar(
                    onFAQTap: { goToFAQ = true },
                    onChatTap: { goToChat = true },
                    onIncidenciaTap: { goToIncidencia = true }
                )
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $goToFAQ) {
            FAQView()
        }
        .navigationDestination(isPresented: $goToChat) {
            ChatView()
        }
        .navigationDestination(isPresented: $goToIncidencia) {
            IncidenciaView()
        }
    }
    
    @ViewBuilder
    private func infoRow(
        label: String,
        value: String,
        highlight: Bool = false,
        underlined: Bool = false,
        italic: Bool = false
    ) -> some View {
        
        HStack(alignment: .top, spacing: 6) {
            Text("\(label):")
                .foregroundColor(.white)
                .font(.system(size: 11.5, weight: .bold))
                .frame(width: 54, alignment: .leading)
            
            Group {
                if italic {
                    Text(value).italic()
                } else {
                    Text(value)
                }
            }
            .underline(underlined, color: .white)
            .foregroundColor(highlight ? .yellow : .white)
            .font(.system(size: 11.5, weight: highlight ? .bold : .regular))
            .fixedSize(horizontal: false, vertical: true)
            
            Spacer(minLength: 0)
        }
    }
    
    @ViewBuilder
    private func actionButton(title: String) -> some View {
        Button(action: {
            // Acción futura
        }) {
            Text(title)
                .font(.system(size: 12.5, weight: .medium))
                .foregroundColor(AppTheme.itesoBlue)
                .frame(width: 170, height: 32)
                .background(Color.white)
                .cornerRadius(9)
        }
    }
}

#Preview {
    NavigationStack {
        ActivityDetailView()
    }
}
