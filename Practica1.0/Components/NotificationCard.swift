import SwiftUI

struct NotificationCard: View {

    let text: String

    var body: some View {
        Text(text)
            .foregroundColor(.black)
            .font(.subheadline)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(16)
    }
}

