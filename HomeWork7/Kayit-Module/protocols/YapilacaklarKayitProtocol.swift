//
//  YapilacaklarKayitProtocol.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

protocol ViewToPresenterYapilacaklarKayitProtocol {
    var kayitInteractor:PresenterToInteractorYapilacaklarKayitProtocol? {get set}
    //var kayitView:PresenterToViewYapilacaklarKayitProtocol? {get set}
    
    func ekle(yapilacak_is:String)

}

protocol PresenterToInteractorYapilacaklarKayitProtocol {
    func toDoEkle(yapilacak_is:String)
}

protocol PresenterToRouterYapilacaklarKayitProtocol {
    static func createModule(ref:YapilacakIsKayitViewController)
}
 
