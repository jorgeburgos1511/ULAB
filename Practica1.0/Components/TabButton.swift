import SwiftUI

struct TabButton: View {

    let title: String
    let selected: Bool

    var body: some View {
        Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(selected ? .blue : .white)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        selected
                        ? Color.white
                        : Color.white.opacity(0.25)
                    )
            )
    }
}

#Preview {
    HStack(spacing: 12) {
        TabButton(title: "Todos", selected: true)
        TabButton(title: "Talleres", selected: false)
        TabButton(title: "Conferencias", selected: false)
    }
    .padding()
    .background(Color(red: 8/255, green: 36/255, blue: 64/255))
}

