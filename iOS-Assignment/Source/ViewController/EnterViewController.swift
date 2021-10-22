//
//  EnterViewController.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/08.
//

import UIKit

class EnterViewController: UIViewController {
    
    // MARK: Property
    var userName: String?
    
    // MARK: @IBOutlets
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var userNameLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameLabel()
        setUIButton()
    }
    
    // MARK: Functions
    func setUIButton() {
        confirmButton.layer.cornerRadius = 10
    }
    
    func setNameLabel() {
        if let user = userName {
            userNameLabel.text = user
        }
    }
    
    private func pushHomeViewController() {
        let tabbarStoryboard = UIStoryboard(name: Const.Storyboard.Name.tabbar, bundle: nil)
        guard let tabbarViewController = tabbarStoryboard.instantiateViewController(withIdentifier: Const.ViewController.Identifier.tabbar) as? TabbarViewController else {
            return
        }
        let navigation = UINavigationController(rootViewController: tabbarViewController)
        navigation.modalPresentationStyle = .overFullScreen
        
            self.present(navigation, animated: true, completion: nil)
        }
    
    private func dismissMainViewController() {
        self.dismiss(animated: true)
    }
    
    // MARK: @IBAction
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        pushHomeViewController()
    }
    
    @IBAction func toucnAnotherAccount(_ sender: UIButton) {
        dismissMainViewController()
    }
}

