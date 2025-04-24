//
//  MakeNicknameViewController.swift
//  week02
//
//  Created by 조영서 on 4/23/25.
//

import UIKit
import SnapKit

final class LoginBottomSheetViewController: UIViewController {
    
    var onNicknameEntered: ((String) -> Void)?

    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "한글만 입력할 수 있어요"
        textField.textColor = .black
        textField.backgroundColor = .gray2
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.layer.cornerRadius = 3

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 44))
        textField.leftView = paddingView
        textField.leftViewMode = .always

        return textField
    }()
    
    private func validateInputFields() {
        let nickname = nicknameTextField.text ?? ""
        
        let isValid = !nickname.trimmingCharacters(in: .whitespaces).isEmpty
        updateButtonState(isEnabled: isValid)
    }
    
    @objc private func nicknameTextFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }

        let filtered = text.filter { String($0).isKoreanOnly }
        
        if text != filtered {
            textField.text = filtered
        }

        validateInputFields()
    }
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.isEnabled = false
        return button
    }()
    
    @objc private func saveButtonTapped() {
        let nickname = nicknameTextField.text ?? ""
        onNicknameEntered?(nickname)
        dismiss(animated: true)
    }
    
    private func updateButtonState(isEnabled: Bool) {
        saveButton.isEnabled = isEnabled
        saveButton.backgroundColor = isEnabled ? .tvingRed : .black
        saveButton.layer.borderWidth = 0
        saveButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    // MARK: - 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldDidChange), for: .editingChanged)
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)

        
        // MARK: - 타이틀 레이블
        let titleLabel = UILabel()
        titleLabel.text = "닉네임을 입력해주세요"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "Pretendard-Medium", size: 23)
        
        
        // MARK: - addSubview
        view.addSubview(titleLabel)
        view.addSubview(nicknameTextField)
        view.addSubview(saveButton)

    
        // MARK: - 스냅킷 레이아웃
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(190)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
    }
}

#Preview {
    LoginBottomSheetViewController()
}
