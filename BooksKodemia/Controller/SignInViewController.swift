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
    private lazy var userNameInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.userString)
    private lazy var userEmailInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.emailString)
    private lazy var passwordInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.passwordString)
    private lazy var confirmPasswordInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.confirmPasswordString)
    //MARK: UIButtons
    private lazy var confirmButton: FilledButton = FilledButton(title: Constants.acceptString, frame: CGRect())
    private lazy var cancelButton: UnfilledButton = UnfilledButton(title: Constants.cancelString, frame: CGRect())
    
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
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        buttonArray.forEach { button in
            button.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        }
        
//        //Aqui asignamos un color
//        confirmButton.setTitleColor(UIColor.red, for: .normal)
//        //Aqui asignamos la fuente
//        confirmButton.titleLabel?.font = UIFont(name: "Arial", size: 15.0)
        
        self.confirmButton.addTarget(self, action: #selector(onAcceptButtonTap), for: .touchUpInside)
        self.cancelButton.addTarget(self, action: #selector(onCancelButtonTap), for: .touchUpInside)
        
    }
    
    @objc func onAcceptButtonTap() {
        dismissAndContinue()
    }
    
    @objc func onCancelButtonTap() {
        dismiss(animated: true, completion: nil)
    }
    
    func dismissAndContinue() {
        let dashboardNavigationController: UINavigationController = UINavigationController()
        let dashboardViewController: DashboardViewController = DashboardViewController()
        dashboardNavigationController.setViewControllers([dashboardViewController], animated: true)
        dashboardNavigationController.modalPresentationStyle = .overFullScreen
        present(dashboardNavigationController, animated: true, completion: nil)
    }
}
