//
//  TaskViewModel.swift
//  LocationReminder
//
//  Created by 조전형 on 2019/07/15.
//  Copyright © 2019 cho. All rights reserved.
//

import RxSwift
import RxCocoa

class TaskViewModel {
    let titleText = BehaviorSubject(value: "")
    
    lazy var validTitleText = {
       self.titleText.asObserver()
        .map(checkTitleTextField)
        .asDriver(onErrorJustReturn: false)
    }()
    
    func checkTitleTextField(_ text:String) -> Bool {
        return text.count > 0
    }
}
