//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe  on 04/01/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var screen:CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextFields() -> Bool {
        guard let ethanlPrice = screen?.ethanPriceTextField.text else {return false}
        guard let gasPrice = screen?.gasPriceTextField.text else {return false}
        
        if ethanlPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção", message: "Informe os valores do álcool e da gasolina")
            return false
        } else if ethanlPrice.isEmpty {
            alert?.showAlertInformation(title: "Ateção!", message: "Informe o valor do álcool")
            return false
        }else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Ateção!", message: "Informe o valor da Gasolina")
            return false
        }
        
        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate{
    func tappedCalculateButton() {
        
        if validateTextFields() {
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
        
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
