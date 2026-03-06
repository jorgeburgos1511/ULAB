import SwiftUI

struct InfoRow: View {

    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.footnote)
                .foregroundColor(.white.opacity(0.7))

            Text(value)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

