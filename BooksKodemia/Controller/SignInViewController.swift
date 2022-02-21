//
//  SignInViewController.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 20/02/22.
//

import UIKit

class SignInViewController: UIViewController {
    
    private lazy var contentStackView: UIStackView = UIStackView()
    private lazy var buttonStackView: UIStackView = UIStackView()
    //MARK: Textfields
    private lazy var userNameInputTextField: UITextField = UITextField()
    private lazy var userEmailInputTextField: UITextField = UITextField()
    private lazy var passwordInputTextField: UITextField = UITextField()
    private lazy var confirmPasswordInputTextField: UITextField = UITextField()
    //MARK: UIButtons
    private lazy var confirmButton: UIButton = UIButton()
    private lazy var cancelButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        view.backgroundColor = .systemBackground
        
        let textfieldArray: [UITextField] = [userNameInputTextField,
                                            userEmailInputTextField,
                                            passwordInputTextField,
                                            confirmPasswordInputTextField]
        // configurar Stack view
        contentStackView.axis = .vertical
        contentStackView.spacing = Constants.padding
        contentStackView.alignment = .fill
        contentStackView.distribution = .fillEqually
        // Definimos un closure donde se itera cada elemento del arreglo
        // y textfieldElement va asumiendo cada valor del arreglo
        textfieldArray.forEach { textfieldElement in
            contentStackView.addArrangedSubview(textfieldElement)
        }
        // Es lo equivalente a hacer esto
//        for textField in textfieldArray {
//            contentStackView.addArrangedSubview(textField)
//        }
        // Configurar constraints del stack view
        self.view.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.padding),
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        textfieldArray.forEach { textFieldElement in
            textFieldElement.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight).isActive = true
            textFieldElement.layer.borderWidth = 1
        }
        
        let buttonArray: [UIButton] = [ confirmButton, cancelButton]
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = Constants.padding
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        
        buttonArray.forEach { button in
            buttonStackView.addArrangedSubview(button)
        
        }
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate( [
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.padding),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        buttonArray.forEach { button in
            button.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
            button.backgroundColor = .blue
        }
        
        
    }
    
}
