//
//  YapilacaklarDetayRouteer.swift
//  HomeWork7
//
//  Created by Deniz on 20.03.2022.
//

import Foundation

class YapilacaklarDetayRouter : PresenterToRouterYapilacaklarDetayProtocol {
    static func createModule(ref: YapilacakIsDetayViewController) {
        
        ref.detayPresenterNesnesi = YapilacaklarDetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = YapilacaklarDetayInteractor()
    }
    
    
    
}
