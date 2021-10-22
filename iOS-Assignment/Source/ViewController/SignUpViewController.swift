//
//  SignUpViewController.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/07.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Property
    private var passwordTextFieldIsSecurity = true
    
    // MARK: @IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var showPasswordButton: UIButton!
    
    // MARK: Lify Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIButton()
        assignTextFieldDelegate()
    }
    
    // MARK: Functions
    
    private func setUIButton() {
        nextButton.layer.cornerRadius = 10
        nextButton.isEnabled = false
    }
    private func assignTextFieldDelegate() {
        [nameTextField, emailTextField, passwordTextField].forEach{
            $0?.delegate = self
        }
    }
    
    private func showPassword(imageName: String, color: UIColor, bool: Bool) {
        showPasswordButton.setImage(UIImage(systemName: "\(imageName)"), for: .normal)
        showPasswordButton.tintColor = color
        passwordTextField.isSecureTextEntry = bool
        passwordTextFieldIsSecurity = bool
    }
    
    private func presentEnterViewController() {
        let enterStoryboard = UIStoryboard(name: Const.Storyboard.Name.enter, bundle: nil)
        guard let enterViewController = enterStoryboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.enter) as? EnterViewController else { return }
        
        enterViewController.userName = nameTextField.text
        self.modalPresentationStyle = .overFullScreen
        self.present(enterViewController, animated: true, completion: nil)
    }
    
    // MARK: @IBActions
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        presentEnterViewController()
    }
    
    @IBAction func showPasswordButton(_ sender: UIButton) {
        
        if passwordTextFieldIsSecurity {
            showPassword(imageName: "checkmark.square.fill", color: .systemBlue, bool: false)
        } else {
            showPassword(imageName: "square", color: .lightGray, bool: true)
        }
    }
}

// MARK: Extension

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isNameEmpty = nameTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isNameEmpty && !isEmailEmpty && !isPasswordEmpty
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
