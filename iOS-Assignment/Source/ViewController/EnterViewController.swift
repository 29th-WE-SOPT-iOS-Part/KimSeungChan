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

    // MARK: @IBAction
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
