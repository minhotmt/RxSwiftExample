//
//  HomeVC.swift
//  DACatHandbook
//
//  Created by MinhNV-GD on 4/12/20.
//  Copyright © 2020 MinhNV-GD. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UITextField!
    
    var userViewModel = UserViewModel()
    let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    @IBAction func menuAction(_ sender: Any) {
        
    }
    
    func bindUI() {
        tableView.register(UINib(nibName: MenuCell.identifier, bundle: nil), forCellReuseIdentifier: MenuCell.identifier)
        searchText.rx.text.asObservable().bind(to: self.userViewModel.searchInput).disposed(by: disposebag)
        userViewModel.searchResult.asObservable().bind(to: self.tableView.rx.items(cellIdentifier: MenuCell.identifier, cellType: MenuCell.self)){
            (index, user, cell) in
            cell.labelTitle.text = user.un ?? ""
        }.disposed(by: disposebag)
    }
}

