//
//  BaseTableViewCell.swift
//  boilerplate
//
//  Created by Limefriends on 4/25/24.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {
    open override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    open required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure() {
        self.selectionStyle = .none
    }
    
    open func setConstraints() {
        
    }
}
