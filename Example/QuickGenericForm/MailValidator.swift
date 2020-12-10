//
//  MailValidator.swift
//  QuickGenericForm_Example
//
//  Created by Nicolas Frugoni on 10/12/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import QuickGenericForm

class MailValidator: GenericFormFieldValidationRule {
    func check(field: GenericFormField) -> Bool {
        field.value?.contains("@") ?? false
    }
}
