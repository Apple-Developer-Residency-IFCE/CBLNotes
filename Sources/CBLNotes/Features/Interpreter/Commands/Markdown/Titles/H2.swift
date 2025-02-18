import SwiftUI

@available(macOS 13.0, *)
class H2: CommandScheme {
    static let prefix: String = "##"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 32)
    }
}

@available(macOS 13.0, *)
extension H2 {
    static func == (lhs: H2, rhs: H2) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
