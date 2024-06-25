//
//  RequestPriceView.swift
//  SnapshotTestDemo
//
//  Created by Waratnan Suriyasorn on 21.06.24.
//

import SwiftUI

struct RequestPriceView: View {
    @State var value: String
    @State var value2: String
    @State var showError: Bool
    @State var isSubmitButtonEnabled: Bool

    init(value: String = "", value2: String = "", showError: Bool = false, isSubmitButtonEnabled: Bool = true) {
        self.value = value
        self.value2 = value2
        self.showError = showError
        self.isSubmitButtonEnabled = isSubmitButtonEnabled
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("If the vehicle is not available for the auction currently, you can provide us with the expected trade-in date. Vehicle will be priced accordingly.")
                    .font(.headline)

                FloatingTextField(
                    title: "Future trade-in date (dd/MM/yyyy)",
                    value: Binding<String>(get: { value }, set: { value = $0 }),
                    footer: "You can request future trade-in up to 30 days in the future",
                    isError: showError
                )
                .padding(.top, 32)

                FloatingTextField(
                    title: "Expected mileage (KM)",
                    value: Binding<String>(get: { value2 }, set: { value2 = $0 }),
                    footer: "The current mileage you indicated is 114.000 km",
                    isError: showError
                )
                .padding(.top, 16)

                Spacer()
                Image(systemName: "i.circle")
                    .foregroundColor(.orange)

                Text("Our guarantee is based on your evaluation, and the mutual agreement that we have in place. Differences in the car condition (for example wrong car details, mileage or non-advertised damages) may later be discounted from the car price.")
                    .font(.caption)
            }
            .padding(.horizontal, 20)
            VStack {
                Button(action: {
                    self.showError.toggle()
                }, label: {
                    Spacer()
                    Text("Confirm")
                        .font(.title)
                    Spacer()
                })
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(isSubmitButtonEnabled ? .orange : .gray.opacity(0.2))
                )
                .foregroundColor(.white)
                .font(.title2)
                .padding(.all,  8)
            }
            .background(.white)
            .clipShape(.rect(topLeadingRadius: 4, topTrailingRadius: 4, style: .circular))
            .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 0, y: -5)
        }
    }
}


#Preview {
    RequestPriceView(value: "test", value2: "test2")
}
