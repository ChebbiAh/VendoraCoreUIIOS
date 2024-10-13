//
//  PayButton.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI

public enum PayButtonState {
    case disabled
    case enabled
}

public struct PayButton: View {
    let total: Double
    let title: String
    var currency: Currency = .euro
    @State var state: PayButtonState = .disabled
    var action: (() -> Void)? = nil
    
    public init(total: Double, title: String, currency: Currency = .euro, state: PayButtonState = .enabled, action: (() -> Void)? = nil) {
        self.total = total
        self.title = title
        self.currency = currency
        self.state = state
        self.action = action
    }
    
    public var body: some View {
        
        ButtonVendora(title: title + " - " + currency.rawValue + " " + total.formatted(),
                      titleColor: (state == .enabled ? AppColors.textPrimary : Color.gray.opacity(0.9)),
                      backgroundColor: state == .enabled ? AppColors.backgroundGreen : AppColors.accentGreyDark) {
            action?()
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .disabled(state == .disabled)

    }
}

struct PayButtonView: View {
    var body: some View {
        VStack {
            PayButton(total: 10.2, title: "Payer", currency: .dinar, state: .disabled)
            PayButton(total: 10, title: "Payer", currency: .dinar, state: .enabled)

        }
        .padding()
    }
}

#Preview {
    PayButtonView()
}

public enum Currency: String {
    case euro = "€"
    case dinar = "Dt"
    case dollar = "$"
    case other = ""
}
