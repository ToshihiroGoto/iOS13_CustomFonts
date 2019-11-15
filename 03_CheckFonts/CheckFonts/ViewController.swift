//
//  ViewController.swift
//  CheckFonts
//
//  Created by Toshihiro Goto on 2019/10/24.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        checkFonts()
    }

    func checkFonts(){
        let fontName = UIFontDescriptor(fontAttributes:
                                    [UIFontDescriptor.AttributeName.name: "98Font"])
        
        let fontAskArray = [fontName] as CFArray
        
        CTFontManagerRequestFonts(fontAskArray as CFArray) { (unresolved: CFArray) in
            DispatchQueue.main.async {
                print(unresolved)
            }
        }
    }
}

