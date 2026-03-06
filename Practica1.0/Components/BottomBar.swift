import SwiftUI

struct BottomBar: View {

    var onFAQTap: () -> Void
    var onChatTap: () -> Void
    var onIncidenciaTap: () -> Void

    var body: some View {

        HStack {

            bottomButton(
                icon: "questionmark",
                action: onFAQTap
            )

            Spacer(minLength: 80)

            bottomButton(
                icon: "bubble.left",
                action: onChatTap
            )

            Spacer(minLength: 80)

            bottomButton(
                icon: "exclamationmark.triangle",
                action: onIncidenciaTap
            )
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity)
        .background(AppTheme.itesoBlue)
        .ignoresSafeArea(edges: .bottom)
    }

    private func bottomButton(
        icon: String,
        action: @escaping () -> Void
    ) -> some View {

        Button(action: action) {

            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 52, height: 52)
                    .shadow(
                        color: .black.opacity(0.15),
                        radius: 5,
                        y: 3
                    )

                Image(systemName: icon)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(AppTheme.itesoBlue)
            }
        }
    }
}
