//
//  TextEditorView.swift
//  Surf_alexiosdev
//
//  Created by Алексей on 19.12.2024.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .padding(4)
                    .frame(height: 150)
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
            }
            .font(.body)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            Text(countSymbolsForTextEditor(2500))
                .font(.system(size: 14)).bold()
                .foregroundStyle(.gray)
        }
    }
    
    private func countSymbolsForTextEditor(_ max: Int) -> String {
        guard !text.isEmpty else {
            return "Максимум \(max.symbol())"
        }
        
        var result = 0
        result = max - text.count
        
        return result < 0 ?
            "Осталось 0 символов"
        : "Осталось \(result.symbol())"
    }
}

#Preview {
    TextEditorView(text: Binding(projectedValue: .constant("")), placeholder: "Достоинства")
}
