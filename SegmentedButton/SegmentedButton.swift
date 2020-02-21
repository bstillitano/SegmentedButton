//
//  SegmentedButton.swift
//  FieldApp
//
//  Created by Brandon Stillitano on 14/2/20.
//  Copyright © 2020 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SplitButton: UIView {
    //UI Elements
    var containerView: UIView = UIView()
 
    //Data
    var buttons: [UIButton] = [] {
        didSet {
            self.setupUI()
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(buttons: [UIButton]) {
        self.init(frame: .zero)
        self.setData(buttons: buttons)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Setup View
        self.backgroundColor = .clear
        self.containerView.backgroundColor = UIColor(named: "buttonBackgroundColor")
    }

    private func setData(buttons: [UIButton]) {
        //Set Data
        self.buttons = buttons
    }

    func setupUI() {
        //Remove Subviews
        for view: UIView in self.subviews {
            view.removeFromSuperview()
        }
        
        //Setup Container View
        self.containerView.clipsToBounds = true
        self.addSubview(containerView)
        
        //Update Container View Constraints
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        //Setup Data
        var lastButton: UIButton = UIButton()
        var lastButtonIndex: Int = 0
        
        //Itterate Buttons
        for button in buttons {
            //Add Button
            self.containerView.addSubview(button)
            
            //Update Button Constraints
            button.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                
                //Add Conditional Top Constraints
                if lastButtonIndex > 0 {
                    make.top.equalTo(lastButton.snp.bottom)
                } else {
                    make.top.equalToSuperview()
                }
                
                //Add Conditional Bottom Constraints
                if buttons.count == 1 || lastButtonIndex == buttons.count - 1 {
                    make.bottom.equalToSuperview()
                }
            }
            
            //Add Separator
            if lastButtonIndex > 0 {
                //Create Separator
                let separator: Separator = Separator()
                button.addSubview(separator)
                
                //Update Separator Constraints
                separator.snp.makeConstraints { (make) in
                    make.top.equalToSuperview()
                    make.width.equalToSuperview().inset(5)
                    make.centerX.equalToSuperview()
                }
            }
            
            //Update Data
            lastButton = button
            lastButtonIndex += 1
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Add Rounded Corners and Shadows
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 6
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 5
    }
}
