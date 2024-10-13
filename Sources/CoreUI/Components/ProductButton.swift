//
//  ProductButton.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI

struct ProductButton: View {
    let title: String
    let color: Color
    var action: (() -> Void)? = nil
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            ButtonVendora(title: title, backgroundColor: AppColors.backgroundPrimary) {
                action?()
            }
            color
                .frame(height: 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 5))

    }
}

struct ProductButtonView: View {
    var body: some View {
        VStack {
            ProductButton(title: "Saladesdf sdf sdf sdf sdf sdf sf sdf sdf sfd sf sdf sdf sdf sdf sdf sdf sdf  à la chair de crabe pt.", color: AppColors.buttonBlue)
            ProductButton(title: "Salade à la chair de crabe pt.", color: AppColors.buttonBlue)
            ProductButton(title: "Salade à la chair de crabe pt.", color: AppColors.buttonBlue)
        }
        .padding()
    }
}

#Preview {
    ProductButtonView()
}


struct AppColors {
    // Background and general shades
    static let backgroundPrimary = Color(hex: "#363B4A")   // Dark blue-grey
    static let backgroundSecondary = Color(hex: "#19221A") // Dark grey-black
    static let backgroundGreen = Color.green
    static let textPrimary = Color.white        // Almost white
    
    // Button and component colors
    static let buttonBlue = Color(hex: "#3962E7")          // Vibrant blue
    static let buttonGrey = Color(hex: "#566565")          // Muted grey-green
    static let buttonHighlight = Color(hex: "#A98E76")     // Light brown
    
    // Accent colors
    static let accentBlueLight = Color(hex: "#7399CA")     // Light greyish blue
    static let accentGreyDark = Color(hex: "#272B36")      // Dark slate grey
}

// SwiftUI extension to easily use hex colors
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // Skip #
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xff0000) >> 16) / 255
            let g = Double((hexNumber & 0x00ff00) >> 8) / 255
            let b = Double(hexNumber & 0x0000ff) / 255
            self.init(red: r, green: g, blue: b)
        } else {
            self.init(red: 0, green: 0, blue: 0)
        }
    }
}
