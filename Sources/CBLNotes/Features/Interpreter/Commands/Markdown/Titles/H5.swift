import SwiftUI

class H5: CommandScheme {
    static let prefix: String = "#####"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 18).padding(.top, 5).padding(.bottom, 2)
    }
}

extension H5 {
    static func == (lhs: H5, rhs: H5) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
