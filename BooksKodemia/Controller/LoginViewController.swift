//
//  ViewController.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 20/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Una variable lazy, se crea en el momento que
    // la invocamo por primera vez.
    private lazy var userInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.userString)
    
    private lazy var passwordInputTextField: InputTextField = InputTextField(frame: CGRect(), placeHolder: Constants.passwordString)
    
    private lazy var loginButton: FilledButton = FilledButton(title: Constants.logIn, frame: CGRect())
    
    private lazy var signInButton: UnfilledButton = UnfilledButton(title: Constants.signIn, frame: CGRect())
    
    private lazy var textFieldsStackView: UIStackView = UIStackView()
    
    private lazy var buttonsStackView: UIStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // Crear la vista
    private func initUI() {
        self.view.backgroundColor = .systemBackground
        
        // Textfields array
        let textFields: [InputTextField] = [userInputTextField,passwordInputTextField]
        // TextFields Stack view
        view.addSubview(textFieldsStackView)
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = Constants.padding
        textFieldsStackView.alignment = .fill
        textFieldsStackView.distribution = .fillEqually
        
        textFields.forEach { inputTextField in
            textFieldsStackView.addArrangedSubview(inputTextField)
        }
        
        textFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFieldsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        textFields.forEach { inputTextfield in
            inputTextfield.translatesAutoresizingMaskIntoConstraints = false
            inputTextfield.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight).isActive = true
        }
        
        let buttons: [UIButton] = [loginButton,signInButton]
        
        view.addSubview(buttonsStackView)
        buttonsStackView.spacing = Constants.padding
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding),
            buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        buttons.forEach { button in
            buttonsStackView.addArrangedSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight).isActive = true
        }
        
        signInButton.addTarget(self, action: #selector(onSignInButtonTap), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(onLoginButtonTap), for: .touchUpInside)
        
    }
    
    
    @objc func onSignInButtonTap() {
        goToSignIn()
    }
    
    
    func goToSignIn() {
        let signInViewController: SignInViewController = SignInViewController()
        self.present(signInViewController, animated: true, completion: nil)
    }
    
    
    @objc func onLoginButtonTap() {
        goToDashboardView()
    }
    
    func goToDashboardView() {
        let dashboardNavigationController: UINavigationController = UINavigationController()
        let dashboardViewController: DashboardViewController = DashboardViewController()
        dashboardNavigationController.setViewControllers([dashboardViewController], animated: true)
        dashboardNavigationController.modalPresentationStyle = .fullScreen
        present(dashboardNavigationController, animated: true, completion: nil)
        
    }

}

