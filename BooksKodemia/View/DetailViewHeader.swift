//
//  DetailViewHeader.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 06/03/22.
//

import UIKit

class DetailViewHeader: UIView {
    
    private var titleLabel: UILabel?
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        initUI(title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI(title: "")
    }
    
    func set(title: String) {
        titleLabel?.text = title
    }
    
    func initUI(title: String) {
        let label: UILabel = UILabel()
        titleLabel = label
        addSubview(label)
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.detailViewHeaderFont
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        // Constraints
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
        
        //
        layer.masksToBounds = true
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.kodemiaCyan.cgColor
        layer.cornerRadius = Constants.cornerRadius
    }

}
