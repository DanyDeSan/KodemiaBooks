//
//  InputTextField.swift
//  BooksMVVM
//
//  Created by L Daniel De San Pedro on 16/02/22.
//

import UIKit

class InputTextField: UITextField {
    
    var changedValue: (() -> ())?
    
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    weak var nextTextFieldToResign: UITextField?

    init(frame: CGRect, placeHolder: String) {
        super.init(frame: frame)
        self.placeholder = placeHolder
        applyUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyUI()
    }
    
    func applyUI() {
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.kodemiaCyan.cgColor
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
