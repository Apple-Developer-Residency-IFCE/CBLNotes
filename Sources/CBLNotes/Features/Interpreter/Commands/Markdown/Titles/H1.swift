import SwiftUI

class H1: CommandScheme {
    static let prefix: String = "#"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 38)
    }
}

extension H1 {
    static func == (lhs: H1, rhs: H1) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
