//
//  ViewController.swift
//  FontsPicker
//
//  Created by Toshihiro Goto on 2019/10/23.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIFontPickerViewControllerDelegate {

    var fontPicker: UIFontPickerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // フォントピッカーの表示設定
        let fontPickerConfig = UIFontPickerViewController.Configuration()
        
        // 複数のフォントフェイスを表示
        fontPickerConfig.includeFaces = true
        
        // 各フォント名にそのフォントを適応する (true だとシステムフォントで表示されるっぽい)
        fontPickerConfig.displayUsingSystemFont = false
        
        // ボールドフォントのみ表示
        //fontPickerConfig.filteredTraits = .traitBold
        
        // 日本語フォントのみ表示
        //fontPickerConfig.filteredLanguagesPredicate = UIFontPickerViewController.Configuration.filterPredicate(forFilteredLanguages: ["ja"])
        
        // フォントピッカーの設定
        fontPicker = UIFontPickerViewController(configuration: fontPickerConfig)
        fontPicker.delegate = self
    }

    
    // UIButton
    @IBOutlet weak var selectFontButton: UIButton!
    
    // UIButton - Action
    @IBAction func openFontsPicker(_ sender: UIButton) {
        // フォントピッカーを開く
        self.present(fontPicker, animated: true, completion: nil)
        
    }
    
    // UIFontPickerViewControllerDelegate - 選択後
    func fontPickerViewControllerDidPickFont(_ fontPicker: UIFontPickerViewController) {
        if let fontName = fontPicker.selectedFontDescriptor?.postscriptName {
            let size = selectFontButton.titleLabel?.font.pointSize
            selectFontButton.titleLabel?.font = UIFont(name: fontName, size: size!)
            print("FontName: \(fontName)")
        }
    }

    // UIFontPickerViewControllerDelegate - キャンセル
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
    }
    
}

