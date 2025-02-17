import SwiftUI

@available(macOS 13.0, *)
class H3: CommandScheme {
    static let prefix: String = "###"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 26)
    }
}

@available(macOS 13.0, *)
extension H3 {
    static func == (lhs: H3, rhs: H3) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
