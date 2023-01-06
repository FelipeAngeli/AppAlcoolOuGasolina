//
//  HomeVC.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe  on 26/12/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }


}

//seta a rota pra proxima tela
extension HomeVC: HomeScreenDelegate{
    func tappedStartButton() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

