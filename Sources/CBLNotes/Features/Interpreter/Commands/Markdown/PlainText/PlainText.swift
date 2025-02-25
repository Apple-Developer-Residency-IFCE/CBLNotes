import SwiftUI

class PlainText: CommandScheme {
    static let prefix: String = ""

    static func render(_ line: String = "") -> some View {
        return PlainTextHelperView(text: line)
    }
}

extension PlainText {
    static func == (lhs: PlainText, rhs: PlainText) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
