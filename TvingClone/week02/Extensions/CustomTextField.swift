//
//  CustomTextField.swift
//  week02
//
//  Created by 조영서 on 4/20/25.
//

import UIKit

final class CustomTextField: UITextField {
    
    var placeholderColor: UIColor? {
        didSet {
            updatePlaceholder()
        }
    }
    
    override var placeholder: String? {
        didSet {
            updatePlaceholder()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
    }
    
    private func setupStyle() {
        self.layer.cornerRadius = 3
        self.backgroundColor = .gray4
        self.textColor = .white
        self.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.placeholderColor = .gray2
        
        self.addTarget(self, action: #selector(applyRedBorder), for: .editingDidBegin)
        self.addTarget(self, action: #selector(removeBorder), for: .editingDidEnd)
    }
    
    @objc private func applyRedBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray2.cgColor
    }

    @objc private func removeBorder() {
        self.layer.borderWidth = 0
    }
    
    
    private func updatePlaceholder() {
        guard let placeholder = placeholder, let color = placeholderColor else { return }
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: color,
                .font: self.font ?? .systemFont(ofSize: 15)
            ]
        )
    }
}
