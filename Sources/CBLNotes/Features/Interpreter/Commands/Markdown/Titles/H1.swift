import SwiftUI

class H1: CommandScheme {
    static let prefix: String = "#"

    static func render(_ line: String = "") -> some View {
        return VStack(spacing: 2) {
            TitleHelperView(title: line, size: 38, weight: .black)
            Divider()
                .background(Color.gray.opacity(0.6))
        }
        .padding(.top, 5)
        .padding(.bottom, 2)

    }
}

extension H1 {
    static func == (lhs: H1, rhs: H1) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
