import Foundation

protocol MarkdownExpressionType {
    func interpret() -> (String, String)
}
