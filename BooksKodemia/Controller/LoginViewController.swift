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
    private lazy var userInputTextField: UITextField = UITextField()
    
    private lazy var passwordInputTextField: UITextField = UITextField()
    
    private lazy var loginButton: UIButton = UIButton()
    
    private lazy var signInButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // Crear la vista
    private func initUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(userInputTextField)
        // Para que los constraints que definamos en código se tomen en cuenta.
        userInputTextField.translatesAutoresizingMaskIntoConstraints = false
        userInputTextField.placeholder = Constants.userString
        userInputTextField.layer.borderWidth = 1
        // Agregar constraints del User Input
        NSLayoutConstraint.activate([
            userInputTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            userInputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userInputTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        // Configurando password textfield
        self.view.addSubview(passwordInputTextField)
        passwordInputTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordInputTextField.placeholder = Constants.passwordString
        passwordInputTextField.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            passwordInputTextField.topAnchor.constraint(equalTo: userInputTextField.bottomAnchor, constant: Constants.padding),
            passwordInputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordInputTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        //Configurando boton de sign in
        self.view.addSubview(signInButton)
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle(Constants.signIn, for: .normal)
        signInButton.backgroundColor = Constants.buttonBackgroundColor
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.padding),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize)
        ])
        
        //Configurando boton de login
        self.view.addSubview(loginButton)
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.loginButton.setTitle(Constants.logIn, for: .normal)
        self.loginButton.backgroundColor = Constants.buttonBackgroundColor
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -Constants.padding),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize)
        ])
        
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

