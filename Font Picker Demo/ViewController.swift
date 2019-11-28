//
//  ViewController.swift
//  Font Picker Demo
//
//  Created by Amol Rai on 26/11/19.
//  Copyright © 2019 Amol Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {
    
    @IBOutlet weak var myLabel: UILabel!
    
    let fontPicker = UIFontPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontPicker.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Choose Font", style: .plain, target: self, action: #selector(chooseFontButtonPressed))
        myLabel.text = "Hello World"
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        // attempt to read the selected font descriptor, but exit quietly if that fails
        guard let descriptor = viewController.selectedFontDescriptor else { return }
        
        let font = UIFont(descriptor: descriptor, size: 36)
        myLabel.font = font
    }
    
    @objc func chooseFontButtonPressed() {
        present(fontPicker, animated: true)
    }
    
}
