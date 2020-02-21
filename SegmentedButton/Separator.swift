//
//  Separator.swift
//  FieldApp
//
//  Created by Brandon Stillitano on 15/11/19.
//  Copyright © 2019 Ordermentum Pty Ltd. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class Separator: UIView {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Set Background Color
        self.backgroundColor = UIColor(named: "separatorColor")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Set Constraints
        self.snp.makeConstraints { (make) in
            make.height.equalTo(1)
        }
    }
}
