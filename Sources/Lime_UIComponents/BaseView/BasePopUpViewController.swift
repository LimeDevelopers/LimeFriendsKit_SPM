//
//  BasePopUpViewController.swift
//  boilerplate
//
//  Created by Limefriends on 4/25/24.
//

import UIKit
import SnapKit

// 사용 예시
/*
 let customPopUp = BasePopUpViewController()
 customPopUp.popUpTitle = "삭제하시겠습니까?"
 customPopUp.successClicked = {
     self.selectedImages.remove(at: indexPath.item)
     self.downCastingImageDataArray.remove(at: indexPath.item)
     self.addContactUsView.collectionView.reloadData()
 }
 customPopUp.modalPresentationStyle = .overCurrentContext
 self.present(customPopUp, animated: false)
 */


/// Custom PopUp <=> Alert 대체할 목적으로 사용
open class BasePopUpViewController: BaseViewController {
    var popUpTitle: String?
    var popUpDescription: String?
    // 취소 버튼 없애고 싶을때 true, false
    var isHiddenForCancelBtn: Bool = false
    
   private lazy var baseView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = .white
       if #available(iOS 13.0, *) {
           view.layer.cornerCurve = .continuous
       } else {
           // Fallback on earlier versions
       }
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var popUpTitleLabel: UILabel = {
        let view = BaseLabel(text: popUpTitle ?? "", customFont: .semibold, fontSize: 18, textColor: .darkGray, radius: nil, borderColor: nil, aligment: .left, borderWidth: nil)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var popUPDescrptionLabel: UILabel = {
        let view = BaseLabel(text: popUpDescription ?? "", customFont: .semibold, fontSize: 18, textColor: .darkGray, radius: nil, borderColor: nil, aligment: .left, borderWidth: nil)
        view.textAlignment = .center
        return view
    }()
    
    
    private lazy var cancelBtn: UIButton = {
        let button = BaseButton(text: "취소", textColor: .black, bgColor: .white, font: .semibold, fontSize: 15, radius: 7.6, borderColor: nil, borderWidth: nil, image: nil, imageEdge: nil, titleEdge: nil)
        button.layer.borderColor = UIColor(named: "brandColor")?.cgColor
        button.layer.borderWidth = 1
        button.isHidden = self.isHiddenForCancelBtn
        return button
    }()
    
    private var successBtn: UIButton = {
        let button = BaseButton(text: "확인", textColor: .black, bgColor: .white, font: .semibold, fontSize: 15, radius: 7.6, borderColor: nil, borderWidth: nil, image: nil, imageEdge: nil, titleEdge: nil)
        return button
    }()
    
    private lazy var btnStackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [cancelBtn, successBtn])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 18
        return stack
    }()
    
    public var successClicked: (() -> Void)?
    
    public override func configure() {
        self.view.backgroundColor = UIColor(red: 36 / 255 , green: 41 / 255, blue: 47 / 255, alpha: 0.4)
        
        self.view.addSubview(baseView)
        [popUpTitleLabel, popUPDescrptionLabel, btnStackView].forEach {
            baseView.addSubview($0)
        }
        
        self.cancelBtn.addTarget(self, action: #selector(actionCancel), for: .touchUpInside)
        self.successBtn.addTarget(self, action: #selector(actionSuccess), for: .touchUpInside)
    }
    
    @objc func actionCancel() {
        print("팝업 취소 버튼 눌림")
        self.dismiss(animated: false)
    }
    
    @objc func actionSuccess() {
        print("팝업 확인 버튼 눌림")
        successClicked?()
        self.dismiss(animated: false)
    }
    
    /// 레이아웃 설정
    public override func setConstraints() {
        
        baseView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.greaterThanOrEqualTo(290)
        }
        
        
        popUpTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(32)
            make.leading.equalToSuperview().inset(20)
        }
        
        popUPDescrptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.popUpTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.popUpTitleLabel.snp.leading)
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        btnStackView.snp.makeConstraints { make in
            make.top.equalTo(self.popUPDescrptionLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.popUpTitleLabel.snp.leading)
            make.height.equalTo(45)
            make.bottom.equalToSuperview().inset(18)
        }
    }
}

