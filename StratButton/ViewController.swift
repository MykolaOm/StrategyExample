//
//  ViewController.swift
//  StratButton
//
//  Created by Nikolas Omelianov on 5/27/19.
//  Copyright © 2019 Nikolas Omelianov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var strategyVC: StrategyVC?
    var currentStrategy: StrategyEnum = .push
    var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button = setButton()
        if let btn = button {
            btn.addTarget(self, action: #selector(executeStrategy), for: .touchUpInside)
            self.view.addSubview(btn)
        }
    }

    @objc func executeStrategy(){
        currentStrategy = checkScreenNumb()
        switch currentStrategy {
            case .pop:
                strategyVC = BackToStartStrategy()
            case .push:
                strategyVC = PushStrategy()

        }
        strategyVC?.presentVC(vc: self)
    }
    func checkScreenNumb() -> StrategyEnum {
        if self.navigationController?.viewControllers.count ?? 0 > 2 {
            return .pop
        } else {
            return .push
        }
    }
    func setButton() -> UIButton {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        var text = "I AM "
        if let numb = self.navigationController?.viewControllers.count {
            text += ("\(numb)")
        }
        btn.setTitle(text, for: .normal)
        btn.center = self.view.center

        return btn
    }
}

