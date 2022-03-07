//
//  DetailViewBody.swift
//  BooksKodemia
//
//  Created by L Daniel De San Pedro on 06/03/22.
//

import UIKit

class DetailViewBody: UIView {
    
    private var contentLabel: UILabel?
    private var sectionLabel: UILabel?

    init(frame: CGRect, content: String, section: String) {
        super.init(frame: frame)
        initUI(content: content, section: section)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI(content: "", section: "")
    }
    
    func initUI(content: String, section: String) {
        let sectionLabel: UILabel = UILabel()
        self.sectionLabel = sectionLabel
        addSubview(sectionLabel)
        sectionLabel.text = section
        sectionLabel.font = Constants.sectionBodyFont
        sectionLabel.textColor = .systemGray
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionLabel.numberOfLines = 1
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: Constants.padding),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding)
        ])
        
        
        
        let label: UILabel = UILabel()
        contentLabel = label
        addSubview(label)
        label.text = content
        label.font = Constants.detailBodyFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: Constants.padding),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.padding),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding)
        ])
        
        layer.masksToBounds = true
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.kodemiaCyan.cgColor
        layer.cornerRadius = Constants.cornerRadius
    }
}
