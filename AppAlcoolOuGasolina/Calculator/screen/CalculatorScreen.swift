//
//  CalculatorScreen.swift
//  AppAlcoolOuGasolina
//
//  Created by Felipe  on 04/01/23.
//

import UIKit

protocol CalculatorScreenDelegate: AnyObject{
    func tappedCalculateButton()
    func tappedBackButton()
    
}

class CalculatorScreen: UIView {
    
    private weak var delegate: CalculatorScreenDelegate?
    
    public func delegate(delegate:CalculatorScreenDelegate?){
        self.delegate = delegate
    }
    
//    private weak var delegate: BackButtonDelegate?
//
//    public func delegate(delegate: tapped)
    
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
     lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "LOGO menor")
         image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var ethanPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Álcool"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var gasPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedCalculateButton(){
        delegate?.tappedCalculateButton()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Botão Back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedBackButton(){
        delegate?.tappedBackButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImage)
        addSubview(logoAppImageView)
        addSubview(ethanPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            ethanPriceTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 134),
            ethanPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasPriceTextField.topAnchor.constraint(equalTo: ethanPriceTextField.bottomAnchor, constant: 20),
            gasPriceTextField.leadingAnchor.constraint(equalTo: ethanPriceTextField.leadingAnchor),
            gasPriceTextField.trailingAnchor.constraint(equalTo: ethanPriceTextField.trailingAnchor),
            gasPriceTextField.heightAnchor.constraint(equalTo: ethanPriceTextField.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
