//
//  BaseTextField.swift
//  jaram_iOS
//
//  Created by Limefriends on 3/8/24.
//

import UIKit

public class BaseTextField : UITextField {
    
    /// TextField 셋팅
    /// - Parameters:
    ///   - placeHolder: 플레이스홀더
    ///   - textColor: 텍스트 색상
    ///   - tintColor: Tint 색상
    ///   - radius: Radius
    ///   - curve: Curve
    ///   - borderColor: borderColor
    ///   - borderWidth: borderWidth
    ///   - keyboardType: 키보드 타입
    ///   - clearButtonMode: 텍스틑 필드 cancel 버튼 유무
    @available(iOS 13.0, *)
    public init(placeHolder: String,
         textColor: UIColor,
         tintColor: String,
         radius: CGFloat?,
         curve: CALayerCornerCurve = .continuous,
         borderColor: UIColor = .gray,
         borderWidth: CGFloat = 1,
         keyboardType: UIKeyboardType = .default,
         clearButtonMode: UITextField.ViewMode = .never) {
        super.init(frame: .zero)
        self.placeholder = placeHolder
        
        
        if let radius {
            self.layer.cornerRadius = radius
            self.layer.cornerCurve = curve
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
        
        self.addLeftPadding() // 왼쪽 padding 추가
        self.textColor = textColor
        self.returnKeyType = .done
        self.keyboardType = keyboardType
        self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.tintColor = UIColor(named: tintColor)
        self.clearButtonMode = clearButtonMode
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
      }
}
