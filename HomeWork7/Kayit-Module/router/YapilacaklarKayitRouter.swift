//
//  YapilacaklarKayitRouterProtocol.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import Foundation

class YapilacaklarKayitRouter : PresenterToRouterYapilacaklarKayitProtocol {
    static func createModule(ref: YapilacakIsKayitViewController) {
        
        ref.yapilacaklarKayitPresenterNesnesi = YapilacaklarKayitPresenter()
        ref.yapilacaklarKayitPresenterNesnesi?.kayitInteractor = YapilacaklarKayitInteractor()
        
    }
    
    
}
