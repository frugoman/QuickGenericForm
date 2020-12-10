//
//  CustomFormValidator.swift
//  QuickGenericForm_Example
//
//  Created by Nicolas Frugoni on 10/12/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import QuickGenericForm

class CustomFormValidator: FormValidator {
    func isFormFieldValid(_ fields: [GenericFormField], forGenericForm form: GenericForm) -> Bool {
        var isValid = true
        fields.forEach { field in
            if let custom = field as? CustomField {
                custom.changeBackground(color: .white)
            }
            field.validations.forEach { rule in
                if !rule.check(field: field) {
                    if let custom = field as? CustomField {
                        custom.changeBackground(color: .red)
                    }
                    isValid = false
                }
            }
        }
        return isValid
    }
}
