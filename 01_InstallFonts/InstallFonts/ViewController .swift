//
//  ViewController.swift
//  InstallFonts
//
//  Created by Toshihiro Goto on 2019/10/17.
//  Copyright © 2019 Toshihiro Goto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func installFont1(_ sender: UIButton) {
        installFonts("98font")
    }
    
    @IBAction func installFont2(_ sender: UIButton) {
        installFonts("PalaceGothic")
    }
    
    
    func installFonts(_ fontName:String){
        guard let mainBundleURL = Bundle.main.url(forResource: fontName, withExtension: "otf") else {
            print("File Not Found!")
            return
        }
        
        let fontURLArray = [mainBundleURL] as CFArray
        CTFontManagerRegisterFontURLs(fontURLArray, .persistent, true) { (errors, done) -> Bool in
            
            if CFArrayGetCount(errors) > 0 {
                print(errors as Array)
                return false
            }
            
            if done {
                print("done")
                return true
            }

            return true
        }
        /*
         void CTFontManagerRegisterFontURLs(CFArrayRef fontURLs, CTFontManagerScope scope, bool enabled, bool (^registrationHandler)(CFArrayRef errors, bool done));
         
         fontURLs
            フォントURLの配列
         
         scope
            登録の可用性と有効期間を定義する定数
         
         enabled
            URLから派生したフォントでフォント記述子の一致を有効にするか、
            CTFontManagerRequestFontsで検出可能にするかを示すブール値。
         
         registrationHandler
             エラーが発見されたとき、または完了時に呼び出されるブロック。
             errors パラメーターは、CFError 参照の配列が含まれる。
             空の配列はエラーがないことを示す。
             各エラー参照には、kCTFontManagerErrorFontURLsKey に対応するフォント URL の CFArray が含まれ
             エラーを引き起こし、正常に登録されなかったフォントファイルを表す。
             ハンドラは、登録プロセス中に複数回呼び出される場合があり、
             登録プロセスが完了すると、完了パラメーターは true に設定される。
             操作を停止する場合、ハンドラーは false を返す必要があり
             エラーを受け取った後に行うと良い場合がある。
         
         
         CTFontManagerScope
             フォント登録の範囲（スコープ）
             セッションの使用とは、macOSのログインセッションと iOS の現在の起動セッションを指す。

         kCTFontManagerScopeNone
             フォントは登録されておらず、フォントディスクリプタの一致に関与しない。
             フォントの登録時に指定する有効なスコープではありません。

         kCTFontManagerScopeProcess
             フォントは直接登録解除しない限り、現在のプロセスが継続中である場合使用できる。

         kCTFontManagerScopePersistent
             フォントは現在のユーザーセッションのすべてのプロセスで使用でき、
             登録解除しない限り後続のセッションで使用できる。
             （以前の user と同じ説明)

         kCTFontManagerScopeSession
             このフォントは現在のユーザーセッションで使用でき、
             以降のセッションでは使用でき無い。
             セッションスコープは macOS でのみ使用可能。
        */
    }
}
