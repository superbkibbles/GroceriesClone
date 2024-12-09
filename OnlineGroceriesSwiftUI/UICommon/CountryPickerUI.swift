//
//  CountryPickerUI.swift
//  OnlineGroceriesSwiftUI
//
//  Created by Mend Mzury on 11/23/24.
//

import SwiftUI
import CountryPicker

struct CountryPickerUI: UIViewControllerRepresentable {
    @Binding var country: Country?
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "IN"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension CountryPickerUI {
    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPickerUI
        
        init(_ parent: CountryPickerUI) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}
