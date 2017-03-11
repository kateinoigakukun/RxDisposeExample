//
//  SecondViewController.swift
//  RxDisposeExample
//
//  Created by SaitoYuta on 2017/03/11.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {

    var nextButton: UIButton!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        nextButton = UIButton(frame: CGRect(x: view.center.x, y: view.center.y,
                                            width: 100, height: 20))
        nextButton.setTitle("Second", for: .normal)
        nextButton.setTitleColor(.green, for: .normal)
        view.addSubview(nextButton)

        nextButton.rx.tap
            .do(onNext: {
                print($0)
            }, onError: { e in
                print(e)
            }, onCompleted: {
                print("Complete✨")
            }, onSubscribe: {
                print("Subscribe📝")
            }, onDispose: {
                print("Dispose☠")
            })
            .subscribe(onNext: { [weak self] in
                let nextVC = ThirdViewController()
                self?.navigationController?.pushViewController(nextVC, animated: true)
            }).addDisposableTo(disposeBag)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
