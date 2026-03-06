import SwiftUI

struct BottomIcon: View {

    let system: String

    var body: some View {
        Image(systemName: system)
            .font(.title2)
            .foregroundColor(.blue)
            .frame(width: 44, height: 44)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.15), radius: 4)
    }
}

