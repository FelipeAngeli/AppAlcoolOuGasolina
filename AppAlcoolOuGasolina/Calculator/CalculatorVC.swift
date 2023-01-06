//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe  on 04/01/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen:CalculatorScreen?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }

}

extension CalculatorVC: CalculatorScreenDelegate{
    func tappedCalculateButton() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let ethanlPrice: Double = (formatter.number(from: screen?.ethanPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0
        
        if ethanlPrice / gasPrice > 0.7 {
            print("Melhor utilizar Gasolina!")
        } else {
            print("Melhor utilizar Álcool!")
        }
        
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
