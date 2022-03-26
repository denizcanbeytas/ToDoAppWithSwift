//
//  YapilacaklarDetayProtocols.swift
//  HomeWork7
//
//  Created by Deniz on 20.03.2022.
//

import Foundation

protocol ViewToPresenterYapilacaklarDetayProtocol {
    var detayInteractor : PresenterToInteractorYapilacaklarDetayProtocol? {get set}
    
    func guncelle (yapilacak_id:Int,yapilacak_is:String)
    
}

protocol PresenterToInteractorYapilacaklarDetayProtocol {
    
    func toDoGuncelle (yapilacak_id:Int,yapilacak_is:String)
}

protocol PresenterToRouterYapilacaklarDetayProtocol {
    static func createModule(ref:YapilacakIsDetayViewController)
}
