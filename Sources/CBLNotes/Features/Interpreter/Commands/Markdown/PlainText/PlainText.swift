import SwiftUI

@available(macOS 13.0, *)
class PlainText: CommandScheme {
    static let prefix: String = ""

    static func render(_ line: String = "") -> some View {
        return PlainTextHelperView(text: line)
    }
}

@available(macOS 13.0, *)
extension PlainText {
    static func == (lhs: PlainText, rhs: PlainText) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
