//
//  YapilacaklarPresenter.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation
class YapilacaklarAnasayfaPresenter:ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func toDolarıYukle() {
        anasayfaInteractor?.tumToDolarıAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.toDoAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil (yapilacak_id: Int) {
        anasayfaInteractor?.toDoSil(yapilacak_id: yapilacak_id)
    }
}

extension YapilacaklarAnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(toDoList: Array<Yapilacaklar>) {
        anasayfaView?.vieweVeriGonder(toDoList: toDoList)
    }
}
