//
//  YapilacaklarAnasayfaProtocols.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

// main protcols

protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func toDolarıYukle()
    func ara(aramaKelimesi:String)
    func sil(yapilacak_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumToDolarıAl()
    func toDoAra(aramaKelimesi:String)
    func toDoSil(yapilacak_id:Int)
}

//

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(toDoList:Array<Yapilacaklar>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(toDoList:Array<Yapilacaklar>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:YapilacaklarViewController)
}

