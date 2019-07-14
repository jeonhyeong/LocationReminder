//
//  AddViewController.swift
//  LocationReminder
//
//  Created by 조전형 on 2019/07/15.
//  Copyright © 2019 cho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var cancleButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var disposeBag:DisposeBag = DisposeBag()
    var taskViewModel = TaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onCancle()
        bindInput()
        bindOutput()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        disposeBag = DisposeBag()
    }
    
    func onCancle() {
        cancleButton.rx.tap
            .subscribe(onNext: { self.dismiss(animated: true, completion: nil) })
            .disposed(by: disposeBag)
    }
    
    func onSaveButton() {
        
    }
    
    func bindInput() {
        titleTextField.rx.text.orEmpty
            .bind(to: taskViewModel.titleText)
            .disposed(by: disposeBag)
    }
    
    func bindOutput() {
        taskViewModel.validTitleText
            .drive(onNext: { self.navigationItem.rightBarButtonItem?.isEnabled = $0 })
            .disposed(by: disposeBag)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
