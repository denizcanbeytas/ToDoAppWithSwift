//
//  YapilacaklarRouter.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

class YapilacaklarRouter:PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: YapilacaklarViewController) {
        let presenter = YapilacaklarAnasayfaPresenter()
        
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = YapilacaklarAnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
