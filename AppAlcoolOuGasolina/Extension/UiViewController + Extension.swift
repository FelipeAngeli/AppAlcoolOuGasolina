//
//  UiViewController + Extension.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe  on 16/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dimissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dimissKeyboard() {
        view.endEditing(true)
    }
}
