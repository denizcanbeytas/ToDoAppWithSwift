//
//  YapilacaklarKayitPresenterProtocol.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

class YapilacaklarKayitPresenter : ViewToPresenterYapilacaklarKayitProtocol {
    var kayitInteractor: PresenterToInteractorYapilacaklarKayitProtocol?
    
    
    func ekle(yapilacak_is: String) {
        kayitInteractor?.toDoEkle(yapilacak_is: yapilacak_is)
    }
    
    
    
    
}
