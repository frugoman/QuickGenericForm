//
//  CustomField.swift
//  QuickGenericForm_Example
//
//  Created by Nicolas Frugoni on 10/12/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import QuickGenericForm
import UIKit

class CustomField: FormFieldView {
    
    public var id: String
    
    private let field = UITextField(forAutoLayout: ())
    
    required public init(id: String) {
        self.id = id
        super.init(frame: .zero)
        setupView()
    }
    
    public var validations: [GenericFormFieldValidationRule] = []
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(field)
        field.autoPinEdgesToSuperviewEdges()
    }
    
    public var borderStyle: CustomField.BorderStyle {
        get { .from(textFieldBorderStyle: field.borderStyle) }
        set { field.borderStyle = newValue.textField }
    }
    
    public var placeholder: String? {
        get { field.placeholder }
        set { field.placeholder = newValue }
    }
    
    public override func becomeFirstResponder() -> Bool {
        return field.becomeFirstResponder()
    }
    
    public var value: String? {
        get { field.text }
        set { field.text = newValue }
    }
    
    func changeBackground(color: UIColor) {
        field.backgroundColor = color
    }
}

extension CustomField {
    public enum BorderStyle: Int {
        case none = 0
        case line = 1
        case bezel = 2
        case roundedRect = 3
    }
}

extension CustomField.BorderStyle {
    static func from(textFieldBorderStyle style: UITextField.BorderStyle) -> CustomField.BorderStyle {
        CustomField.BorderStyle(rawValue: style.rawValue) ?? .none
    }
    
    var textField: UITextField.BorderStyle {
        return UITextField.BorderStyle(rawValue: self.rawValue) ?? .none
    }
}
