//
//  YapilacaklarInteractor.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

class YapilacaklarAnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniUrl = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        db = FMDatabase(path: veritabaniUrl.path)
    }
    
    func tumToDolarıAl() {
        var liste = [Yapilacaklar]()
        
        db?.open()
        
        do {
            let q = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while q.next(){
                let yapilacak_id = Int(q.string(forColumn: "yapilacak_id"))!
                let yapilacak_is = q.string(forColumn: "yapilacak_is")!
                
                let toDo = Yapilacaklar(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
                
                liste.append(toDo)
            }
             anasayfaPresenter?.presenteraVeriGonder(toDoList: liste)
        }catch{}
        
        db?.close()
        
        
    }
    
    func toDoAra(aramaKelimesi: String) {
        
        var liste = [Yapilacaklar]()
        
        db?.open()
        
        
        do {
            let q = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while q.next(){
                let yapilacak_id = Int(q.string(forColumn: "yapilacak_id"))!
                let yapilacak_is = q.string(forColumn: "yapilacak_is")!
                
                let toDo = Yapilacaklar(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
                
                liste.append(toDo)
            }
             anasayfaPresenter?.presenteraVeriGonder(toDoList: liste)
        }catch{}
        db?.close()
        
    }
    
    func toDoSil(yapilacak_id: Int) {
        db?.open()
        do{
            try db?.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumToDolarıAl()
        }catch{}
        db?.close()
        
    }
    
    
}
