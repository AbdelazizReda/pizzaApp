//
//  HomeViewModel.swift
//  pizzaApp
//
//  Created by عبدالعزيز رضا  on 3/29/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private var sliderTimer:Timer?
    private var currentSlide = 0
    var slider:BehaviorRelay<[Int]> = .init(value: [1,2,3,4,5,6])
    var populerItem:BehaviorRelay<[Proudect]> = .init(value:[.init(name: "title"),.init(name: "title"),.init(name: "title"),.init(name: "title"),.init(name: "title"),.init(name: "title")]
        
        
    )

    
//var sliderToItemIndex: ((Int) -> Void)?
    var slideToItem:PublishSubject<Int> = .init()

    
    
    func viewDidLoad(){
        sliderTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func scrollToNext(){
        let nextSlide = currentSlide + 1
        currentSlide = nextSlide % slider.value.count
         slideToItem.onNext(currentSlide)
        
    }
    
    //MARK: puplice Variables
    var NumberOfItems:Int{
        return slider.value.count
    }
    
}

