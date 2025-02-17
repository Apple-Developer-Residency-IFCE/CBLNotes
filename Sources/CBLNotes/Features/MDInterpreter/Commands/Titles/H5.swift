import SwiftUI

@available(macOS 13.0, *)
class H5: CommandScheme {
    static let prefix: String = "#####"

    static func render(_ line: String = "") -> some View {
        return TitleHelperView(title: line, size: 18)
    }
}

@available(macOS 13.0, *)
extension H5 {
    static func == (lhs: H5, rhs: H5) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
