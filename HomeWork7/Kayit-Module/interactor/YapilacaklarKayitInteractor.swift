//
//  YapilacaklarKayitInteractor.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

class YapilacaklarKayitInteractor : PresenterToInteractorYapilacaklarKayitProtocol {
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    
    func toDoEkle(yapilacak_is: String) {
        
        db?.open()
        
        do{
            try db?.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{}
        
        db?.close()
        
    }
    
   
    
    
}
