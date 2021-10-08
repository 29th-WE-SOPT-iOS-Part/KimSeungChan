//
//  ViewController.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
   
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignTextFieldDelegate()
    }
    
    // MARK: Functions
    private func assignTextFieldDelegate() {
        [nameTextField, emailTextField, passwordTextField].forEach{
            $0?.delegate = self
        }
    }
    
    private func pushSignUpViewController() {
        let signUpStoryboard = UIStoryboard(name: Const.Storyboard.Name.signUp, bundle: nil)
        guard let signUpViewController = signUpStoryboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signUp) as? SignUpViewController else { return }
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    private func presentEnterViewController() {
        let enterStoryboard = UIStoryboard(name: Const.Storyboard.Name.enter, bundle: nil)
        guard let enterViewController = enterStoryboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.enter) as? EnterViewController else { return }
        
        enterViewController.userName = nameTextField.text
        self.modalPresentationStyle = .overFullScreen
        self.present(enterViewController, animated: true, completion: nil)
    }
    
    // MARK: @IBActions
    
    @IBAction func makeNewID(_ sender: UIButton) {
        pushSignUpViewController()
    }
    @IBAction func touchNextButton(_ sender: UIButton) {
        presentEnterViewController()
        
    }
    
    
}
    // MARK: Extension
extension ViewController: UITextFieldDelegate {
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
