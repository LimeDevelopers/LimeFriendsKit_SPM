//
//  BaseView.swift
//  jaram_iOS
//
//  Created by Limefriends on 2024/02/26.
//

import UIKit


public class BaseView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure() {
        
    }
    
    public func setConstraints() {
        
    }
    
    /// View 상단에만 Corenr 적용 -> View에서 layoutSubViews에서 적용
    /// - Parameters:
    ///   - view: 원하는 View
    ///   - radius: radius 값
    public func applyTopCornersRadius(view: UIView, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
}
