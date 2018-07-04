//
//  DynamicView.swift
//  DynamicTitleViewSwift
//
//  Created by Moon on 2018/7/1.
//  Copyright © 2018年 Moon. All rights reserved.
//

import UIKit

protocol DynamicViewDelegate: AnyObject {
    func dynamicDidBeginEditing()
    func dynamicDidEndEditing()
}

class DynamicView: UIView, UITextFieldDelegate {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate:DynamicViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        Bundle.main.loadNibNamed("DynamicView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func titleLabelMoveUp() {
        UIView.animate(withDuration: 0.25) {
            self.titleLabel.font = UIFont.systemFont(ofSize: 12)
            self.titleLabel.transform = CGAffineTransform.init(translationX: 0, y: -35)
            self.titleLabel.textColor = .red
            self.underlineView.backgroundColor = .red
        }
    }
    
    private func titleLabelMoveDown() {
        UIView.animate(withDuration: 0.25) {
            self.titleLabel.font = UIFont.systemFont(ofSize: 22)
            self.titleLabel.transform = CGAffineTransform.identity
            self.titleLabel.textColor = .black
            self.underlineView.backgroundColor = .black
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Function: \(#function), line: \(#line)")
        titleLabelMoveUp()
        
        if let delegate = delegate {
            delegate.dynamicDidBeginEditing()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Function: \(#function), line:\(#line)")
        if textField.hasText {
            titleLabel.textColor = .black
            underlineView.backgroundColor = .black
        }
        else {
            titleLabelMoveDown()
        }
        
        if let delegate = delegate {
            delegate.dynamicDidEndEditing()
            
        }
    }
}
