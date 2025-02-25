import Foundation

class MarkdownExpression: MarkdownExpressionType {
    private let input: String

    init(input: String) {
        self.input = input
    }

    func interpret() -> (String, String) {
        let splitedInput = input.split(separator: " ",
                                       maxSplits: 1,
                                       omittingEmptySubsequences: true)
        
        if splitedInput.count > 1 {
            let command = splitedInput[0].trimmingCharacters(in: .whitespacesAndNewlines)
            let associatedValue = splitedInput[1].trimmingCharacters(in: .whitespacesAndNewlines)
            return (command, associatedValue)
        } else {
            return ("", input)
        }
    }
}
