//
//  BaseLabel.swift
//  jaram_iOS
//
//  Created by Limefriends on 2024/02/26.
//

import UIKit

public class BaseLabel : UILabel {
    
    public var textInsets: UIEdgeInsets = .zero {
        didSet {
            // 값이 변경될때마다 뷰의 내부 크기와 그리기 로직 갱신
            invalidateIntrinsicContentSize() // 내재된 콘텐츠의 크기가 변경되었다는 것을 시스템에 알림
            setNeedsDisplay() // 콘텐츠가 변경되었을때 변경사항을 반영하도록 지시 -> draw 메서드 다시 호출 -> UI 그림
        }
    }
    /// - Parameters: UILabel 셋팅
    ///   - text: 텍스트
    ///   - customFont: 텍스트 폰트
    ///   - fontSize: 텍스트 사이즈
    ///   - textColor: 텍스트 컬러
    ///   - bgColor: 텍스트 배경색
    ///   - radius: 텍스트 Radius
    ///   - borderColor: borderColor
    ///   - aligment: 텍스트 정렬
    ///   - borderWidth: borderWidth
    ///   - lines: 텍스트 줄 갯수
    public init(text: String, customFont: UIFont.Weight,
         fontSize: CGFloat,
         textColor: UIColor = .black,
         bgColor: UIColor = .clear,
         radius: CGFloat?,
         borderColor: UIColor?,
         aligment: NSTextAlignment,
         borderWidth: CGFloat?,
         lines: Int = 1)
    {
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont.systemFont(ofSize: fontSize, weight: customFont)
        self.numberOfLines = lines
        self.backgroundColor = bgColor
        self.textColor = textColor
        self.textAlignment = aligment
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
        
        
    }
    
    /// - Parameters: UILabel에서 특정한 부분을 강조하고 싶거나 색상을 바꿔주고 싶을때
    ///   - baseString: 전체 Label
    ///   - basic: 강조되지 않을 Label
    ///   - basicFontSize: 강조하고 싶지 않은 Label의 사이즈
    ///   - emphasis: 강조하고 싶은 Label
    ///   - emphasisFont: 강조하고 싶은 Label의 사이즈
    public init(baseString: String, basic: String, basicFontSize: CGFloat, emphasis: String, emphasisFont: CGFloat) {
        super.init(frame: .zero)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let platFormLabelDes = baseString
        // 바뀌지 않을 부분
        let basicLabel = (platFormLabelDes as NSString).range(of: basic)
        // 바꾸고 싶은 부분
        let rangeChange = (platFormLabelDes as NSString).range(of: emphasis)
        let attributedString = NSMutableAttributedString(string: platFormLabelDes)
        
        // 색상 변경을 위한 속성 설정
        
        // 폰트 변경을 위한 속성 설정
        let font = UIFont.systemFont(ofSize: basicFontSize, weight: .regular)
        let emphasisFont = UIFont.systemFont(ofSize: emphasisFont, weight: .bold)
        attributedString.addAttribute(.font, value: font, range: basicLabel)
        attributedString.addAttribute(.font, value: emphasisFont, range: rangeChange)
        // 행간 조절
        attributedString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        self.textAlignment = .left
        self.numberOfLines = 2
        self.attributedText = attributedString
    }
    
    
    public override func drawText(in rect: CGRect) {
        // textInsets가 .zero가 아닐때만 적용
        if textInsets != .zero {
            super.drawText(in: rect.inset(by: textInsets))
        } else {
            super.drawText(in: rect)
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        // textInsets가 .zero가 아닐때만 적용
        if textInsets != .zero {
            let width = size.width + textInsets.left + textInsets.right
            let height = size.height + textInsets.top + textInsets.bottom
            return CGSize(width: width, height: height)
        }
        return size
    }
    
    public override func sizeToFit() {
        super.sizeToFit()
        self.frame.size = intrinsicContentSize
    }
    
    
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
