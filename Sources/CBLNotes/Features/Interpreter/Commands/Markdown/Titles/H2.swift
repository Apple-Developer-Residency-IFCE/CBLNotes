import SwiftUI

class H2: CommandScheme {
    static let prefix: String = "##"

    static func render(_ line: String = "") -> some View {
        return VStack(spacing: 2) {
            TitleHelperView(title: line, size: 32)
            Divider()
                .background(Color.gray.opacity(0.6))
        }
        .padding(.top, 5)
        .padding(.bottom, 2)
    }
}

extension H2 {
    static func == (lhs: H2, rhs: H2) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
