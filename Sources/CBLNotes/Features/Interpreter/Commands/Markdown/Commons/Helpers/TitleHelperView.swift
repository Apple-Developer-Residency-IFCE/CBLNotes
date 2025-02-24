import SwiftUI

struct TitleHelperView: View {
    var title: String?
    var size: CGFloat = 17
    var weight: Font.Weight = .bold
    var italic: Bool = false
    var underline: Bool = false

    var body: some View {
        Text(title ?? "")
            .font(.system(size: size,
                          weight: weight,
                          design: .default))
            .italic(italic)
            .underline(underline)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}
