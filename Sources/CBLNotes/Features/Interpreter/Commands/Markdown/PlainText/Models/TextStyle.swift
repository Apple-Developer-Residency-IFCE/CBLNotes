import Foundation

enum TextStyle: Hashable {
    case normal
    case bold
    case italic
    case underline
    case strikethrough
    case code

    var delimiters: (start: String, end: String) {
        switch self {
        case .bold:
            return ("@", "@")
        case .italic:
            return ("*", "*")
        case .underline:
            return ("_", "_")
        case .strikethrough:
            return ("-", "-")
        case .code:
            return ("`", "`")
        case .normal:
            return ("", "")
        }
    }
}
