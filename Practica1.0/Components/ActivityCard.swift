import SwiftUI

struct ActivityCard: View {

    let day: String
    let month: String
    let title: String
    let location: String
    let time: String
    let color: Color
    let status: String
    let statusColor: Color

    var body: some View {

        ZStack(alignment: .topTrailing) {

            HStack(spacing: 16) {

                // FECHA
                VStack(spacing: 2) {
                    Text(day)
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)

                    Text(month)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.8))
                }
                .frame(width: 45)

                // BLOQUE DE TEXTO
                VStack(alignment: .leading) {

                    Spacer()

                    // TÍTULO
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)

                    // Ubicación + Hora alineadas horizontalmente
                    HStack {

                        Text(location)
                            .font(.system(size: 13))
                            .italic()
                            .foregroundColor(.white.opacity(0.9))

                        Spacer()

                        Text(time)
                            .font(.system(size: 11)) // MÁS PEQUEÑA
                            .foregroundColor(.white.opacity(0.85))
                    }
                    .padding(.top, 6) // baja un poco la ubicación

                    Spacer()
                }

                Spacer()
            }
            .padding(18)
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(color)
            .cornerRadius(18)

            // STATUS ARRIBA DERECHA
            Text(status)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(statusColor)
                .padding(.top, 12)
                .padding(.trailing, 16)
        }
    }
}
