//
//  LoginView.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Mend Mzury on 11/26/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode)  var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
            
            VStack {
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:40)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Loging")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundStyle(Color.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your emails and password")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundStyle(Color.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(txt: $loginVM.txtEmail, isShowPassword: .constant(false) ,title: "Email", placeholder: "Enter your email address", keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineTextField(txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword ,title: "Password",isPassword: true, placeholder: "Enter your password")
                    .modifier(ShowButton(isShow: $loginVM.isShowPassword))
                    .padding(.bottom, .screenWidth * 0.02)
                
                
                Button {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton(title: "Log in") {
                    loginVM.serviceCallLogin()
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.05)
                
                HStack {
                    Text("Don't have an account?")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                    
                    Button {
                        
                    } label: {
                        Text("Signup")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundStyle(Color.primaryApp)
                    }
                }
                
                
                
                Spacer()
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            
            VStack {
                
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
        }
        .alert(isPresented: $loginVM.showError) {
            Alert(title: Text(Globs.Appname), message: Text(loginVM.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
