//
//  ViewController.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import UIKit

class YapilacakIsDetayViewController: UIViewController {
    
    @IBOutlet weak var yapilacaklarDetayText: UITextField!
    @IBOutlet weak var updateView: UIView!
    @IBOutlet weak var updateBtn: UIButton!
    
    var yapilacaklar:Yapilacaklar?
    var detayPresenterNesnesi : ViewToPresenterYapilacaklarDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateView.layer.cornerRadius = 15
        updateBtn.layer.cornerRadius = 15
        
        YapilacaklarDetayRouter.createModule(ref: self)
        
        if let k = yapilacaklar {
            yapilacaklarDetayText.text = k.yapilacak_is
        }
    }
    @IBAction func guncelleButtonyapilcaklarDetay(_ sender: Any) {
        if let toDo = yapilacaklarDetayText.text, let yapilacaklar = yapilacaklar {
            detayPresenterNesnesi?.guncelle(yapilacak_id: yapilacaklar.yapilacak_id!, yapilacak_is: toDo)
        }
    }
    
    
}

