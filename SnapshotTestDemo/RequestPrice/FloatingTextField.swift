//
//  FloatingTextField.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 21.06.24.
//

import SwiftUI

struct FloatingTextField: View {
    var title: String
    @Binding var value: String
    var footer: String
    @FocusState var isFocused: Bool
    var isError: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                Group {
                    if isFocused || !value.isEmpty {
                        Text(title)
                            .transition(.opacity.animation(.easeIn))
                            .font(.subheadline)
                    }
                    TextField(
                        isFocused ? "" : title,
                        text: $value,
                        prompt: Text(isFocused ? "" : title)
                            .foregroundColor(isError ? .red : .gray))
                    .font(.title3)
                    .focused($isFocused)
                    Text(footer)
                        .font(.footnote)
                }.foregroundColor(isError ? .red : .black)
            }
            .padding(.horizontal, 8)
            Divider().background( isError ? .red : .gray)
        }
    }
}
#Preview {
    FloatingTextField(
        title: "Title",
        value: Binding<String>(get: { "value" }, set: { _ in }),
        footer: "Footer",
        isError: false
    )
}
