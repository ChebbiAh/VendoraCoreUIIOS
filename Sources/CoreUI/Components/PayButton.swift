//
//  PayButton.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI

enum PayButtonState {
    case disabled
    case enabled
}

struct PayButton: View {
    let total: Double
    let title: String
    var currency: Currency = .euro
    @State var state: PayButtonState = .disabled
    var action: (() -> Void)? = nil
    
    var body: some View {
        
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

enum Currency: String {
    case euro = "€"
    case dinar = "Dt"
    case dollar = "$"
    case other = ""
}
