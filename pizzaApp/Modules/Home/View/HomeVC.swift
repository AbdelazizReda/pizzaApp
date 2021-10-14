//
//  HomeVC.swift
//  pizzaApp
//
//  Created by عبدالعزيز رضا  on 3/25/21.
//  Copyright © 2021 abdelazizReda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    //MARK:- outlets
    @IBOutlet weak var SliderCollectionView: UICollectionView!
    
    @IBOutlet weak var PopularTableView: UITableView!
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        registerCell()
        bind()
        setupPopulerTableView()
        viewModel.viewDidLoad()
    }
    
    func bind(){
        
        viewModel.slideToItem.subscribe(onNext: { [weak self]  (index) in
            self?.SliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: [.centeredHorizontally , .centeredVertically], animated: true)
            }).disposed(by: disposeBag)
    }
    
    func setupPopulerTableView() {
        PopularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.populerItem.asObservable()
            .bind(to: PopularTableView.rx.items(cellIdentifier: String(describing: popularCell.self), cellType: popularCell.self)){ index, model, cell in
                cell.ratingView.configuerWithRating(rating: 3, style: .compact)
        }.disposed(by: disposeBag)
        
        
    }
    
    
    
    
    
    
    //MARK:- Registere UI
    func registerCell(){
        SliderCollectionView.registerCell(cellClass: SlidreCell.self)
        PopularTableView.registerCellNib(cellClass: popularCell.self)
    }
    
    func setupUI(){
        SliderCollectionView.delegate = self
        SliderCollectionView.dataSource = self
    }
    
    //MARK:- the intilizer of nib and xib
    init() {
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK:- collectionView methods
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.NumberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SlidreCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
