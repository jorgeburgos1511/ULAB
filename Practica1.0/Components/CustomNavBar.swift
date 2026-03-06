import SwiftUI

struct CustomNavBar: View {

    let style: NavBarStyle
    var onBack: (() -> Void)? = nil
    var onNotificationTap: (() -> Void)? = nil
    var onProfileTap: (() -> Void)? = nil

    private let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    var body: some View {

        ZStack {

            primaryColor
                .ignoresSafeArea(edges: .top)

            HStack(spacing: 12) {

                switch style {

                // MARK: - HOME STYLE
                case .home(let profileName):

                    Button {
                        onProfileTap?()
                    } label: {
                        HStack(spacing: 12) {

                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Mi perfil")
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.7))

                                Text(profileName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }
                        }
                    }

                    Spacer()

                    Button {
                        onNotificationTap?()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 44, height: 44)
                                .shadow(color: .black.opacity(0.15), radius: 4)

                            Image(systemName: "bell")
                                .foregroundColor(primaryColor)
                                .font(.system(size: 18, weight: .medium))
                        }
                    }

                // MARK: - BACK STYLE
                case .back(let title):

                    HStack {

                        Button {
                            onBack?()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.title3)
                                .frame(width: 44, height: 44)
                        }

                        Spacer()

                        Text(title)
                            .foregroundColor(.white)
                            .font(.headline)

                        Spacer()

                        Color.clear
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
        .frame(height: 90)
    }
}
