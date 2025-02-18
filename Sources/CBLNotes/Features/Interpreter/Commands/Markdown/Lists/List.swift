import SwiftUI

@available(macOS 13.0, *)
class List: CommandScheme {
    static let prefix: String = "-"

    static func render(_ line: String = "") -> some View {
        TitleHelperView(title: "· " + line,
                        size: 17,
                        weight: .regular)
            .padding(.leading, 10)
    }
}

@available(macOS 13.0, *)
extension List {
    static func == (lhs: List, rhs: List) -> Bool {
        lhs.hashValue.description == rhs.hashValue.description
    }
}
