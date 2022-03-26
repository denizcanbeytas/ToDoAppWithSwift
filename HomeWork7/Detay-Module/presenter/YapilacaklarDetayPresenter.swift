//
//  YapilacaklarDetayPresenter.swift
//  HomeWork7
//
//  Created by Deniz on 20.03.2022.
//

import Foundation

class YapilacaklarDetayPresenter : ViewToPresenterYapilacaklarDetayProtocol{
    var detayInteractor: PresenterToInteractorYapilacaklarDetayProtocol?
    
    func guncelle(yapilacak_id:Int,yapilacak_is: String) {
        detayInteractor?.toDoGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
    
    
}
