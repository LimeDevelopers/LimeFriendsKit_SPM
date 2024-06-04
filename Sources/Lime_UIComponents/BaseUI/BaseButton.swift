//
//  BaseButton.swift
//  jaram_iOS
//
//  Created by Limefriends on 3/6/24.
//

import UIKit

public class BaseButton: UIButton {
    
    /// - Parameters: UIButton - 버튼 텍스트, 버튼 색, 버튼 배경색, 버튼 폰트, 버튼 폰트 사이즈, CornerRadius
    ///   - text: 버튼 텍스트
    ///   - textColor:  버튼 텍스트 컬러
    ///   - bgColor: 버튼 배경색
    ///   - font: 버튼 font
    ///   - fontSize: 버튼 fontSize
    ///   - radius: 버튼 cornerRadius
    ///   - borderColor: 버튼 borderColor
    ///   - borderWidth: 버튼 borderWidth
    ///   - minimumScaleFactor: 버튼 내부의 텍스트 사이즈 조절
    public init(text: String,
         textColor: UIColor = .red,
         bgColor: UIColor = .clear,
         font: UIFont.Weight,
         fontSize: CGFloat,
         radius: CGFloat?,
         borderColor: UIColor?,
         borderWidth: CGFloat?,
         image: String?,
         imageEdge: UIEdgeInsets?,
         titleEdge: UIEdgeInsets?,
         minimumScaleFactor: CGFloat = 1.0) {
        super.init(frame: .zero)
        

        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = bgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: font)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = minimumScaleFactor // 최소 50%까지 축소 가능
        
        if let radius {
            self.layer.cornerRadius = radius
            if #available(iOS 13.0, *) {
                self.layer.cornerCurve = .continuous
            } else {
                // Fallback on earlier versions
            }
            self.clipsToBounds = true
        }
        
        if let borderColor, let borderWidth {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
        
        
        
        if let image, let imageEdge {
            self.setImage(UIImage(named: image), for: .normal)
            self.imageEdgeInsets = imageEdge
        }
        
        if let titleEdge {
            self.titleEdgeInsets = titleEdge
        }
    }
    
    /// - Parameters: Tag가 필요한 Button
    ///   - title: 타이틀
    ///   - titleColor: 타이틀 색상
    ///   - tag: 태그
    ///   - font: 폰트
    ///   - fontsize: 폰트 사이즈
    public init(title: String, titleColor: UIColor, tag: Int, font: UIFont.Weight, fontsize: CGFloat) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.tag = tag
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontsize, weight: font)
    }
    
    ///
    /// - Parameter snsLogin: SNS Login Button 셋팅
    public init(snsLogin: String) {
        super.init(frame: .zero)
        self.setTitle("", for: .normal)
        self.setImage(UIImage(named: snsLogin), for: .normal)
        self.frame = CGRect(x: 0, y: 0, width: 54, height: 54)
    }
    
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
