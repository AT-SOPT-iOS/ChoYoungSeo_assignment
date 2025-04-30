//
//  LoginViewController.swift
//  week02
//
//  Created by 조영서 on 4/19/25.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController, UITextFieldDelegate {

    private var nickname: String?
    
    // MARK: - UI 요소
    
    private let idResetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "xcircle"), for: .normal)
        button.tintColor = .gray3
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let pwResetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "xcircle"), for: .normal)
        button.tintColor = .gray3
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eyeslash"), for: .normal)
        button.tintColor = .gray3
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    
    private lazy var idTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "아이디"

        idResetButton.frame = CGRect(x: 0, y: 8, width: 20, height: 20)
        idResetButton.addTarget(self, action: #selector(clearIdText), for: .touchUpInside)

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        container.addSubview(idResetButton)

        textField.rightView = container
        textField.rightViewMode = .always
        
        textField.delegate = self
        textField.rightView?.isHidden = true

        return textField
    }()

    
    @objc private func clearIdText() {
        idTextField.text = ""
        validateInputFields()
    }
    
    private lazy var pwTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true

        pwResetButton.frame = CGRect(x: -12, y: 8, width: 20, height: 20)
        pwResetButton.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)

        eyeButton.frame = CGRect(x: 20, y: 8, width: 20, height: 20)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 36))
        container.addSubview(pwResetButton)
        container.addSubview(eyeButton)

        textField.rightView = container
        textField.rightViewMode = .always
        
        textField.delegate = self
        textField.rightView?.isHidden = true

        return textField
    }()

    @objc private func clearPasswordText() {
        pwTextField.text = ""
        validateInputFields()
    }
    
    @objc private func togglePasswordVisibility() {
        pwTextField.isSecureTextEntry.toggle()
        let imageName = pwTextField.isSecureTextEntry ? "eyeslash" : "eye_on"
        eyeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    private func validateInputFields() {
        let email = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        
        guard !email.isEmpty, !password.isEmpty else {
            updateButtonState(isEnabled: false)
            return
        }
        
        let isValid = email.isValidEmail && password.isValidPassword
        updateButtonState(isEnabled: isValid)
    }
    
    @objc private func textFieldDidChange(_ sender: UITextField) {
        validateInputFields()
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.rightView?.isHidden = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.rightView?.isHidden = true
    }
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.isEnabled = false
        return button
    }()
    
    // 이메일/닉네임 값 전달
    @objc private func loginButtonTapped() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
        welcomeVC.nickname = nickname
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    // 활성화 여부 색 변경
    private func updateButtonState(isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
        
        if isEnabled {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.backgroundColor = .tvingred
            loginButton.layer.borderWidth = 0
            loginButton.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    private let findIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()

    private let findPwButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return button
    }()
    
    private let dividerLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = .gray4
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        return label
    }()

    private lazy var findInfoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [findIdButton, dividerLabel, findPwButton])
        stack.axis = .horizontal
        stack.spacing = 33
        stack.alignment = .center
        return stack
    }()
        
    let askAccount: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray3
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let makenameButton: UIButton = {
        let button = UIButton(type: .system)

        let title = "닉네임 만들러가기"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray2,
            .font: UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }()
    
    @objc private func showBottomSheet() {
        let bottomSheetVC = LoginBottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .pageSheet
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        bottomSheetVC.onNicknameEntered = { [weak self] nickname in
            self?.nickname = nickname
        }
        
        present(bottomSheetVC, animated: true)
    }

    private lazy var guideStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [askAccount,makenameButton])
        stack.axis = .horizontal
        stack.spacing = 33
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        idResetButton.addTarget(self, action: #selector(clearIdText), for: .touchUpInside)
        pwResetButton.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        makenameButton.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        
        
        // MARK: - 타이틀 레이블
        let titleLabel = UILabel()
        titleLabel.text = "TVING ID 로그인"
        titleLabel.textColor = .gray1
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "Pretendard-Medium", size: 23)
        
        
        // MARK: - addSubview
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(loginButton)
        view.addSubview(findInfoStackView)
        view.addSubview(guideStackView)


        // MARK: - 스냅킷 레이아웃
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(37)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(21)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(52)
        }
        
        findInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(31)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
        }
        
        guideStackView.snp.makeConstraints { make in
            make.top.equalTo(findInfoStackView.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
        }
    }
}

#Preview {
    LoginViewController()
}
