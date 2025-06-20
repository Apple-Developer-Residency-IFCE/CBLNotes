import SwiftUI

class H4: CommandScheme {
    static let prefix: String = "####"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 22).padding(.top, 5).padding(.bottom, 2)
    }
}

extension H4 {
    static func == (lhs: H4, rhs: H4) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
