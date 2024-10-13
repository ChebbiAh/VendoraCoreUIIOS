//
//  CalculatorView.swift
//  CoreUI
//
//  Created by Ahmed Chebbi on 13/10/2024.
//

import SwiftUI
import Combine

class KeypadViewModel: ObservableObject {
    @Published var input: String = ""  // Holds the input from the keypad

    // Function to handle button presses
    func handleButtonPress(_ label: String?) {
        guard let label = label else { return }

        switch label {
        case "C":
            input = ""  // Clear the input
        case "X":
            if !input.isEmpty {
                input.removeLast()  // Remove the last character
            }
        default:
            input += label  // Append the pressed button label to input
        }
    }
}

struct KeypadView: View {
    @ObservedObject var viewModel: KeypadViewModel  // Inject the ViewModel into the view

    let buttonSpacing: CGFloat = 8
    let buttonSize: CGFloat = 75

    var body: some View {
        VStack(spacing: buttonSpacing) {
            // Display the input field
            Text(viewModel.input)
                .font(.largeTitle)
                .padding()

            // Keypad buttons grid
            ForEach(keypadLayout, id: \.self) { row in
                HStack(spacing: buttonSpacing) {
                    ForEach(row, id: \.self) { button in
                        KeypadButton(
                            label: button.label,
                            icon: button.icon,
                            backgroundColor: button.backgroundColor,
                            textColor: button.textColor,
                            size: buttonSize,
                            action: {
                                viewModel.handleButtonPress(button.label)
                            }
                        )
                    }
                }
            }
        }
    }
}

struct KeypadButton: View {
    var label: String? = nil
    var icon: String? = nil
    var backgroundColor: Color = Color.gray
    var textColor: Color = Color.white
    var size: CGFloat = 75
    var action: () -> Void  // Add a closure for button action

    var body: some View {
        Button(action: {
            action()  // Execute the action when the button is pressed
        }) {
            if let label = label {
                Text(label)
                    .font(.title2)
                    .frame(width: size, height: size)
                    .foregroundColor(textColor)
                    .background(backgroundColor)
                    .cornerRadius(10)
            } else if let icon = icon {
                Image(systemName: icon)
                    .font(.title2)
                    .frame(width: size, height: size)
                    .foregroundColor(textColor)
                    .background(backgroundColor)
                    .cornerRadius(10)
            }
        }
    }
}

struct KeypadButtonModel: Hashable {
    let label: String?
    let icon: String?
    let backgroundColor: Color
    let textColor: Color
}

let keypadLayout: [[KeypadButtonModel]] = [
    [
        KeypadButtonModel(label: "C", icon: nil, backgroundColor: Color.red, textColor: .white),
        KeypadButtonModel(label: ".", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: nil, icon: "delete.left", backgroundColor: Color.black, textColor: .white)
    ],
    [
        KeypadButtonModel(label: "7", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "8", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "9", icon: nil, backgroundColor: Color.black, textColor: .white)
    ],
    [
        KeypadButtonModel(label: "4", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "5", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "6", icon: nil, backgroundColor: Color.black, textColor: .white)
    ],
    [
        KeypadButtonModel(label: "1", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "2", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "3", icon: nil, backgroundColor: Color.black, textColor: .white)
    ],
    [
        KeypadButtonModel(label: "00", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "0", icon: nil, backgroundColor: Color.black, textColor: .white),
        KeypadButtonModel(label: "X", icon: nil, backgroundColor: Color.black, textColor: .blue)
    ]
]


//struct KeypadView_Previews: PreviewProvider {
//    @StateObject var viewModel = KeypadViewModel()
//
//    var body: some View {
//        VStack {
//            KeypadView(viewModel: viewModel)
//            
//            // You can use the input from the KeypadViewModel anywhere here
//            Text("Current Input: \(viewModel.input)")
//                .font(.title)
//                .padding()
//        }
//    }
//}
