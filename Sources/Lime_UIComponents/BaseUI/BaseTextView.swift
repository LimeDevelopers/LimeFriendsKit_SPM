//
//  BaseTextView.swift
//  boilerplate
//
//  Created by Limefriends on 5/3/24.
//

import UIKit

public class BaseTextView: UITextView {
    public init(radius: CGFloat, curve: CALayerCornerCurve, borderColor: UIColor, borderWidth: CGFloat, textColor: UIColor, returnKeyType: UIReturnKeyType = .default, font: UIFont.Weight, fontsize: CGFloat, inset: CGFloat, tintColor: UIColor) {
        super.init(frame: .zero, textContainer: nil)
        self.layer.cornerRadius = radius
        if #available(iOS 13.0, *) {
            self.layer.cornerCurve = curve
        } else {
            // Fallback on earlier versions
        }
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.textColor = textColor
        self.returnKeyType = returnKeyType
        self.font = UIFont.systemFont(ofSize: fontsize, weight: font)
        self.textContainerInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        self.tintColor = tintColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
