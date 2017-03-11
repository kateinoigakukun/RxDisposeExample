//
//  ThirdViewController.swift
//  RxDisposeExample
//
//  Created by SaitoYuta on 2017/03/11.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

import UIKit
import RxSwift

class ThirdViewController: UIViewController {

    var backButton: UIButton!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        backButton = UIButton(frame: CGRect(x: view.center.x, y: view.center.y,
                                            width: 100, height: 20))
        backButton.setTitle("Back to root", for: .normal)
        backButton.setTitleColor(.green, for: .normal)
        view.addSubview(backButton)

        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                _ = self?.navigationController?.popToRootViewController(animated: true)
            }).addDisposableTo(disposeBag)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
