import Foundation
import SwiftUI

@available(macOS 13.0, *)
struct PlainTextHelperView: View {
    var text: String

    var body: some View {
        renderProcessedText(from: text)
    }
    
    private func renderProcessedText(from text: String) -> some View {
        let parts = parseTextWithEmphasis(text: text)
        return parseEmphasis(parts: parts)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
    
    private func parseEmphasis(parts: [TextPart]) -> some View {
        var finalText = Text("")
        
        for part in parts {
            switch part.style {
            case .normal:
                finalText = finalText + Text(part.content)
            case .bold:
                finalText = finalText + Text(part.content).bold()
            case .italic:
                finalText = finalText + Text(part.content).italic()
            case .underline:
                finalText = finalText + Text(part.content).underline()
            case .strikethrough:
                finalText = finalText + Text(part.content).strikethrough()
            case .code:
                finalText = finalText + Text(part.content).font(.system(.body, design: .monospaced))
            }
        }
        return finalText
    }
    
    private func parseTextWithEmphasis(text: String) -> [TextPart] {
        let patterns = [
            (style: TextStyle.bold, regex: "@(.*?)@"),
            (style: TextStyle.italic, regex: "\\*(.*?)\\*"),
            (style: TextStyle.underline, regex: "_(.*?)_"),
            (style: TextStyle.strikethrough, regex: "-(.*?)-"),
            (style: TextStyle.code, regex: "`(.*?)`"),
        ]
        
        var parts: [TextPart] = []
        var remainingText = text
        
        while !remainingText.isEmpty {
            
            // Procure pela primeira correspondência em todos os padrões
            
            if let match = patterns.lazy.compactMap({ pattern in
                remainingText.range(of: pattern.regex, options: .regularExpression)
                    .map { (style: pattern.style, match: $0) }
            }).first {
                let (style, range) = match
                
                // Adicione o texto antes da correspondência como normal
                
                if range.lowerBound > remainingText.startIndex {
                    let prefixIndex = remainingText.startIndex..<range.lowerBound
                    if remainingText.indices.contains(prefixIndex.lowerBound) && remainingText.indices.contains(prefixIndex.upperBound) {
                        let prefix = String(remainingText[prefixIndex])
                        parts.append(TextPart(content: prefix, style: .normal))
                    }
                }
                
                // Extraia o texto dentro dos delimitadores
                
                
                let highlighted = String(remainingText[range])
                let content = highlighted
                    .replacingOccurrences(of: style.delimiters.start, with: "")
                    .replacingOccurrences(of: style.delimiters.end, with: "")
                parts.append(TextPart(content: content, style: style))
                
                // Atualize o texto restante de forma segura
                
                let newStartIndex = range.upperBound
                if newStartIndex < remainingText.endIndex {
                    remainingText = String(remainingText[newStartIndex...])
                } else {
                    remainingText = ""
                }
                
            } else {
                parts.append(TextPart(content: remainingText, style: .normal))
                break
            }
        }
        
        return parts
    }
}
