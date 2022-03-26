//
//  YapilacakIsKayitViewController.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import UIKit

class YapilacakIsKayitViewController: UIViewController {
    
    @IBOutlet weak var yapilacaklarKayitText: UITextField!
    @IBOutlet weak var kayitView: UIView!
    @IBOutlet weak var kayitBtn: UIButton!
    
    var yapilacaklarKayitPresenterNesnesi:ViewToPresenterYapilacaklarKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kayitView.layer.cornerRadius = 15
        kayitBtn.layer.cornerRadius = 15
        
       YapilacaklarKayitRouter.createModule(ref: self)
    }

    @IBAction func ekleButtonYapilacaklarKayit(_ sender: Any) {
        if let toDo = yapilacaklarKayitText.text {
            yapilacaklarKayitPresenterNesnesi?.ekle(yapilacak_is: toDo)
           
        }
    }
    

}
