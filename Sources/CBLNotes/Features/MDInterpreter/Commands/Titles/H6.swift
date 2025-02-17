import SwiftUI

@available(macOS 13.0, *)
class H6: CommandScheme {
    static let prefix: String = "######"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 15)
    }
}

@available(macOS 13.0, *)
extension H6 {
    static func == (lhs: H6, rhs: H6) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
