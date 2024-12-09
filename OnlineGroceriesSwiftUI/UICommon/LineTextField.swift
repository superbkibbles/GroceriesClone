//
//  LineTextField.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Mend Mzury on 11/30/24.
//

import SwiftUI

struct LineTextField: View {
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    @State var title: String = "Title"
    @State var isPassword: Bool = false
    @State var placeholder: String = "Placeholder"
    @State var keyboardType: UIKeyboardType = .default

    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity,
                       alignment: .leading)
            
            if isShowPassword && isPassword {
                SecureField(placeholder, text: $txt)
            } else {
                TextField(placeholder, text: $txt)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
            }
    
            Divider()
            
        }
    }
}

#Preview {
    LineTextField(txt: .constant(""), isShowPassword: .constant(false), isPassword: true)
}
