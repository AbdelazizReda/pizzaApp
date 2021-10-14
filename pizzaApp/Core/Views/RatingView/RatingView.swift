//
//  RatingView.swift
//  pizzaApp
//
//  Created by عبدالعزيز رضا  on 3/25/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import Foundation
import UIKit


class RatingView:UIView {
    
    //MARK:- Proparits
       private let maxmuimRating = 5
        var rating = 5
        lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 2
        stack.axis = .horizontal
        return stack
    }()
    
    
    //MARK: nit view
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        //configuerWithRating(rating: 3)
    }
    
    
    
    //MARK: setupUI constarints
    func setupUI(){
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    
    //MARK:configuer with rating
    
    func configuerWithRating(rating: Int, style:style = .full) {
        switch style{
            
        case .full:
                 if rating > 0 {
                   for _ in 1...rating {
                       let image = generatingStarView(.filled)
                       stackView.addArrangedSubview(image)
                       
                   }
               }
               
               let nonFilledCount = maxmuimRating - rating
               if nonFilledCount > 0 {
                   for _ in 1...nonFilledCount {
                       let image = generatingStarView(.nonFilled )
                       stackView.addArrangedSubview(image)
                   }
               }
        case .compact:
             let image = generatingStarView(.filled)
             stackView.addArrangedSubview(image)
        
        }
   
    }
    
    //MARK: Generating StarView
    
    private func generatingStarView(_ type:StarType ) -> UIImageView {
        let starImage:UIImage
        switch type{
        case .filled:
            starImage = #imageLiteral(resourceName: "fill1")
        case .nonFilled:
            starImage = #imageLiteral(resourceName: "starGrey")
        }
        let image = UIImageView(image: starImage)
        image.contentMode = .scaleAspectFill
        image.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive =  true
        return image
    
    }
    
    enum StarType{
        case filled
        case nonFilled
    }
    
    enum style {
        case full
        case compact
        
    }
    
}
