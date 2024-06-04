//
//  BaseViewController.swift
//  boilerplate
//
//  Created by Limefriends on 4/17/24.
//

import UIKit

open class BaseViewController : UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
    }
    
    /// 셋팅
    open func configure() {
        self.view.backgroundColor = .white
        if #available(iOS 14.0, *) {
            self.navigationItem.backButtonDisplayMode = .minimal
        } else {
            // Fallback on earlier versions
        }
        self.navigationController?.navigationBar.tintColor = .black
        
        // 네비게이션 바의 외관을 정의하는 UINavigationBarAppearance 객체 생성
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            // 네비게이션 바의 배경색을 흰색으로 설정
            appearance.backgroundColor = .white
            
            // 네비게이션 바의 하단 경계선을 제거하기 위한 설정
            appearance.shadowColor = nil // 경계선 색상을 nil로 설정하여 제거

            // 네비게이션 바에 위에서 설정한 외관을 적용
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance // 스크롤 시에도 동일한 외관 적용
        } else {
            // Fallback on earlier versions
        }
    }
    
    /// 레이아웃
    open func setConstraints() {
        
    }
    
    public func getCustomHtml(content: String) -> String {
        
        let style = """
        <style>
        img {
            display: inline;
            height: auto;
            max-width: 100%;
        }
        </style>
        """

        let body = """
            <div>
            \(content)
            </div>
            """
        return "<html><head>\(style)</head><body>\(body)</body></html>"
    }
    
    public func findTheFileNamePath(fileName: String, fileType: String) -> String {
        let cssPath = Bundle.main.path(forResource: fileName, ofType: fileType)
        print("cssPath - \(String(describing: cssPath))")
        return cssPath ?? ""
    }

    /// 전체 화면 + 네비게이션 적용
    public func fullScreenTranstionWithNavigation(viewController: UIViewController) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    // 빈화면 클릭시 키보드 내리기
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// 코드로 작성된 VC RootVC 이동
    public func changeRootVC(viewController: UIViewController) {
        let vc = viewController
        let window = UIApplication.shared.windows.first{$0.isKeyWindow}
        let nav = UINavigationController(rootViewController: vc)
        window!.rootViewController = nav
    }
    
    
    /// 알럿메시지
    /// - Parameters:
    ///   - title: ""
    ///   - message: 본 문 작성
    ///   - style: Action or Alert
    ///   - isCancelBtn: default false
    ///   - Successcompletion: 성공했을때 이벤트 처리
    ///   - FailCompletion: 실패했을때 이벤트
    public func alertMessage(title: String = "", message: String, style: UIAlertController.Style, isCancelBtn: Bool = false, successCompletion: (() -> Void)?, failCompletion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let success = UIAlertAction(title: "확인", style: .default) { _ in
            successCompletion?()
        }
        
        if isCancelBtn {
            let cancel = UIAlertAction(title: "취소", style: .destructive) { _ in
                failCompletion?()
            }
            alert.addAction(cancel)
        }
        
        alert.addAction(success)
        self.present(alert, animated: true)
    }
    /// Image  + Label 설정 ( ex) 닉네임  중복체크 실패시 경고문 )
    public func partiallyFontAndColorApply(imageName: String, text: String, allOfTextColor: UIColor, font: UIFont.Weight = .regular, fontSize: CGFloat) -> NSMutableAttributedString {
       let text = text // 서버 응답에 따른 조건 처리 후 결정되는 텍스트
       let attributedString = NSMutableAttributedString()
       
       // 이미지 추가
       let imageAttachment = NSTextAttachment()
       imageAttachment.image = UIImage(named: imageName)
       imageAttachment.bounds = CGRect(x: 0, y: -5, width: 18, height: 18)
       attributedString.append(NSAttributedString(attachment: imageAttachment))
       
       // 이미지 다음에 텍스트 추가
       attributedString.append(NSAttributedString(string: " \(text)")) // 이미지와 텍스트 사이에 공간을 주기 위해 앞에 공백 추가
       
       // 텍스트 색상을 빨간색으로 설정
       attributedString.addAttribute(.foregroundColor, value: allOfTextColor, range: NSRange(location: attributedString.length - text.count, length: text.count))
       
       // UIFont 설정이 필요한 경우 추가적인 attribute 설정
       let font = UIFont.systemFont(ofSize: fontSize, weight: font)
       attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributedString.length))
       
       return attributedString
   }
    
    /// 가로 세로 비율을 맞춰서 이미지 사이즈 조절
    public func resizeImage(image: UIImage, height: CGFloat) -> UIImage {
        let scale = height / image.size.height
        let width = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /// 현재 날짜 및 시간
    public func getStartOfCalenar() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentDate = dateFormatter.string(from: date)
        return currentDate
    }
    
    /// 해당 달의 마지막 년, 월, 일 구하기
    public func getEndOfCalendar() -> String {
        let calendar = Calendar.current
        // 현재 날짜와 시간
        let currentDate = Date()
        // 현재 날짜의 연도와 월을 구하기 위해 DateComponents 사용
        let yearAndMonth = calendar.dateComponents([.year, .month], from: currentDate)
        // 특정 년도와 월의 첫째 날을 나타내는 DateComponents 설정
        var components = DateComponents(year: yearAndMonth.year, month: yearAndMonth.month)
        
        // 해당 월의 다음 달의 첫째 날을 설정
        components.month! += 1
        components.day = 0
        
        // 다음 달의 첫째 날에서 하루를 빼면, 원래 월의 마지막날
        if let lastDay = calendar.date(from: components) {
            let lastDayComponent = calendar.dateComponents([.day], from: lastDay)
            return "\(yearAndMonth.year!)-\(yearAndMonth.month!)-\(lastDayComponent.day!) 23:59:59"
        }
        
        return ""
    }
    /// 날짜에 대한 요일
    public func getWeekDay(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        dateFormatter.dateFormat = "EEEE"
        let weekday = dateFormatter.string(from: date)
        return weekday
    }
}
