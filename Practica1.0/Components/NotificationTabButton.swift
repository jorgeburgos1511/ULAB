import SwiftUI

struct NotificationTabButton: View {

    let title: String
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(selected ? .blue : .black)
                .padding(.vertical, 8)
                .padding(.horizontal, 18)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .opacity(selected ? 1 : 0.85)
                )
        }
    }
}

