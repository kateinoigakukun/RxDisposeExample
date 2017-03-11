//
//  ViewController.swift
//  RxDisposeExample
//
//  Created by SaitoYuta on 2017/03/11.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    var nextButton: UIButton!

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton = UIButton(frame: CGRect(x: view.center.x, y: view.center.y,
                                            width: 100, height: 20))
        nextButton.setTitle("First", for: .normal)
        nextButton.setTitleColor(.green, for: .normal)
        view.addSubview(nextButton)
        nextButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let nextVC = SecondViewController()
                self?.navigationController?.pushViewController(nextVC, animated: true)
            }).addDisposableTo(disposeBag)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIViewController {
}
