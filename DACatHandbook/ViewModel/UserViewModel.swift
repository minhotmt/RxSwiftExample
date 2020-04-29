//
//  UserViewModel.swift
//  DACatHandbook
//
//  Created by MinhNV-GD on 4/23/20.
//  Copyright © 2020 MinhNV-GD. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel: NSObject {
    var searchInput = Variable<String?>("")
    var searchResult = Variable<[UserModel]>([])
    let disposebag = DisposeBag()
    override init() {
        super.init()
        bindingData()
    }
    
    func bindingData(){
        self.searchInput.asObservable().subscribe(onNext: { (text) in
            if text?.isEmpty ?? false {
                self.searchResult.value = []
            } else {
                self.requestJson(url: "https://api.github.com/search/users?q=\(text ?? "")")
            }
            
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposebag)
    }
    
    func requestJson(url: String){
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { (data, res, err) in
                if err == nil {
                    do {
                        if let result:Dictionary<String, Any> = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any> {
                            var userArray: Array<UserModel> = []
                            if let item: Array<Any> = result["items"] as? Array<Any>{
                                for i in item{
                                    let user = UserModel(object: i)
                                    userArray.append(user)
                                }
                                self.searchResult.value = userArray
                            }
                        }
                    } catch{}
                }
            }.resume()
        }
    }
}
