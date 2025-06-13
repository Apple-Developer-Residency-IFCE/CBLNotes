import SwiftUI

class H6: CommandScheme {
    static let prefix: String = "######"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 15).padding(.top, 5).padding(.bottom, 2)
    }
}

extension H6 {
    static func == (lhs: H6, rhs: H6) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
