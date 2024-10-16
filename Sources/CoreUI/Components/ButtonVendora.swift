//
//  ButtonVendora.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI

public struct ButtonVendora: View {
    let title: String
    var titleColor = Color.white
    var backgroundColor: Color = AppColors.backgroundPrimary
    var action: (() -> Void)? = nil
    
    public init(title: String, titleColor: Color = Color.white, backgroundColor: Color = AppColors.backgroundPrimary, action: (() -> Void)? = nil) {
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
                .padding(30)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        
    }
}

struct ButtonVendoraView: View {
    var body: some View {
        HStack {
            
            Spacer()
            VStack {
                Spacer()
                ButtonVendora(title: "category 1", backgroundColor: .blue.opacity(0.5))
                ButtonVendora(title: "category 2", backgroundColor: .black.opacity(0.5))
                ButtonVendora(title: "category 3", backgroundColor: .gray.opacity(0.7))
                Spacer()
            }
            Spacer()
        }
        
        
    }
}

#Preview {
    ButtonVendoraView()
}
