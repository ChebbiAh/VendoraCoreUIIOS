//
//  CategoryButton.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI

struct CategoryButton: View {
    let title: String
    let backgroundColor: Color
    var action: (() -> Void)? = nil
    
    var body: some View {
        ButtonVendora(title: title, backgroundColor: backgroundColor) {
            action?()
        }
    }
}

struct CategoryButtonView: View {
    var body: some View {
        HStack {
            
            Spacer()
            VStack {
                Spacer()
                CategoryButton(title: "category 1", backgroundColor: .blue.opacity(0.5))
                CategoryButton(title: "category 2", backgroundColor: .black.opacity(0.5))
                CategoryButton(title: "category 3", backgroundColor: .gray.opacity(0.7))
                Spacer()
            }
            Spacer()
        }
        
        
    }
}

#Preview {
    CategoryButtonView()
}
