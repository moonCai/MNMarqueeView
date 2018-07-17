//
//  ViewController.swift
//  MNMarqueeLabel
//
//  Created by 瓷月亮 on 2018/7/17.
//  Copyright © 2018年 瓷月亮. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 260, width: 60, height: 25))
        button.setTitle("开始", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIColor.green
        button.tag = 1
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var pauseButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 300, width: 60, height: 25))
        button.setTitle("暂停", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIColor.green
        button.tag = 2
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var stopButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 200, y: 340, width: 60, height: 25))
        button.setTitle("结束", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = UIColor.green
        button.tag = 3
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
     private let textList: [String] = ["新浪手机讯", "11月16日上午消息，", "苹果公司近期推出的iOS 11测试版", "已经支持iPhone 8、8 Plus", "以及iPhone X的无线快充功能，", "但实测发现", "其实它的效果没有想象那么好。"]
    
    fileprivate var containerView = UIView(frame: CGRect(x: 50, y: 200, width: UIScreen.main.bounds.width - 100, height: 30))
    fileprivate lazy var marqueeView = MNMarqueeView(frame: CGRect(x: 50, y: 200, width: UIScreen.main.bounds.width - 100, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        marqueeView.backgroundColor = .yellow
        view.addSubview(containerView)
        view.addSubview(marqueeView)
        
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(stopButton)
        
        marqueeView.textList = textList
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        marqueeView.run()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        marqueeView.stop()
    }
    
    @objc func buttonAction(sender: UIButton) {
        switch sender.tag {
        case 1:
            marqueeView.run()
        case 2:
            marqueeView.pause()
        case 3:
            marqueeView.stop()
        default:
            fatalError()
        }
    }

}

