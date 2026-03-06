import SwiftUI

struct HomeView: View {

    @State private var selectedTab: String = "Todos"

    @State private var goToNotifications = false
    @State private var goToFAQ = false
    @State private var goToChat = false
    @State private var goToIncidencia = false
    @State private var goToProfile = false
    @State private var goToActivityRetail = false

    private let activities: [ActivityItem] = [
        ActivityItem(
            day: "19",
            month: "Marzo",
            title: "Bienvenida",
            location: "Auditorio Pedro Arrupe",
            time: "12:00 a 13:00 hrs",
            color: Color(red: 29/255, green: 74/255, blue: 120/255),
            status: "120/123",
            statusColor: .red,
            category: "Conferencias",
            navigatesToDetail: false
        ),
        ActivityItem(
            day: "20",
            month: "Marzo",
            title: "Liderazgo y Emprendimiento: Construyendo un Futuro Exitoso",
            location: "Auditorio M",
            time: "12:00 a 13:00 hrs",
            color: Color(red: 76/255, green: 121/255, blue: 170/255),
            status: "123/123",
            statusColor: .red,
            category: "Talleres",
            navigatesToDetail: false
        ),
        ActivityItem(
            day: "20",
            month: "Marzo",
            title: "Robótica y Automatización: Creando el Futuro",
            location: "Laboratorio de robótica",
            time: "16:00 a 18:00 hrs",
            color: Color(red: 63/255, green: 140/255, blue: 136/255),
            status: "110/123",
            statusColor: .yellow,
            category: "Talleres",
            navigatesToDetail: true
        ),
        ActivityItem(
            day: "21",
            month: "Marzo",
            title: "Inteligencia Emocional y Bienestar en el Trabajo",
            location: "Auditorio D",
            time: "15:00 a 16:30 hrs",
            color: Color(red: 76/255, green: 121/255, blue: 170/255),
            status: "10/123",
            statusColor: .green,
            category: "Talleres",
            navigatesToDetail: false
        )
    ]

    private var filteredActivities: [ActivityItem] {
        switch selectedTab {
        case "Talleres":
            return activities.filter { $0.category == "Talleres" }
        case "Conferencias":
            return activities.filter { $0.category == "Conferencias" }
        default:
            return activities
        }
    }

    var body: some View {

        NavigationStack {

            ZStack {

                Color(red: 8/255, green: 36/255, blue: 64/255)
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    CustomNavBar(
                        style: .home(profileName: "Francisco José Aguilar Morales"),
                        onBack: nil,
                        onNotificationTap: {
                            goToNotifications = true
                        },
                        onProfileTap: {
                            goToProfile = true
                        }
                    )

                    ScrollView {

                        VStack(alignment: .leading, spacing: 20) {

                            Text("Actividades")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal)

                            HStack(spacing: 12) {

                                TabButton(title: "Todos", selected: selectedTab == "Todos")
                                    .onTapGesture { selectedTab = "Todos" }

                                TabButton(title: "Talleres", selected: selectedTab == "Talleres")
                                    .onTapGesture { selectedTab = "Talleres" }

                                TabButton(title: "Conferencias", selected: selectedTab == "Conferencias")
                                    .onTapGesture { selectedTab = "Conferencias" }
                            }
                            .padding(.horizontal)

                            VStack(spacing: 18) {
                                ForEach(filteredActivities) { activity in
                                    ActivityCard(
                                        day: activity.day,
                                        month: activity.month,
                                        title: activity.title,
                                        location: activity.location,
                                        time: activity.time,
                                        color: activity.color,
                                        status: activity.status,
                                        statusColor: activity.statusColor
                                    )
                                    .onTapGesture {
                                        if activity.navigatesToDetail {
                                            goToActivityRetail = true
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)

                            Color.clear.frame(height: 20)
                        }
                        .padding(.top, 16)
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

            .navigationDestination(isPresented: $goToNotifications) {
                NotificationsView()
            }

            .navigationDestination(isPresented: $goToFAQ) {
                FAQView()
            }

            .navigationDestination(isPresented: $goToChat) {
                ChatView()
            }

            .navigationDestination(isPresented: $goToIncidencia) {
                IncidenciaView()
            }

            .navigationDestination(isPresented: $goToProfile) {
                ProfileView()
            }

            .navigationDestination(isPresented: $goToActivityRetail) {
                ActivityDetailView()
            }
        }
    }
}

private struct ActivityItem: Identifiable {
    let id = UUID()
    let day: String
    let month: String
    let title: String
    let location: String
    let time: String
    let color: Color
    let status: String
    let statusColor: Color
    let category: String
    let navigatesToDetail: Bool
}

#Preview {
    HomeView()
}
