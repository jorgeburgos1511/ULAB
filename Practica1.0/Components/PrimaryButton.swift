import SwiftUI

struct PrimaryButton: View {

    let title: String
    let action: () -> Void

    let primaryColor = Color(red: 8/255, green: 36/255, blue: 64/255)

    var body: some View {

        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .background(primaryColor)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

#Preview {
    PrimaryButton(title: "Ingresar") { }
        .padding()
}
