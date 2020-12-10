//
//  ComplexFormViewController.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 12/10/2020.
//  Copyright (c) 2020 Nicolas Frugoni. All rights reserved.
//

import UIKit
import QuickGenericForm

class ComplexFormViewController: UIViewController {

    @IBOutlet weak var form: GenericForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        form.formValidator = CustomFormValidator()
        form.padding = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
        form.fieldSpacing = 8
        form.fields = [
            makeField(id: "firstname", placeholder: "First Name"),
            makeField(id: "lastname", placeholder: "Last Name"),
            makeField(id: "phone", placeholder: "Phone Number", validations: []),
            makeField(id: "email", placeholder: "Email", validations: [
                RequiredFieldValidation(),
                MailValidator()
            ])
        ]
    }

    private func makeField(
        id: String,
        placeholder: String,
        validations: [GenericFormFieldValidationRule] = [RequiredFieldValidation()]
    ) -> CustomField {
        let field = CustomField(id: id)
        field.placeholder = placeholder
        field.borderStyle = .roundedRect
        field.validations = validations
        return field
    }
    
    @IBAction func didTapConfirmButton(_ sender: Any) {
        guard form.isValid else {
            showAlert(withTitle: "Error!", message: "Invalid form")
            return
        }
        switch form.getValue(usingGenerator: UserValueGenerator()) {
            case let .success(user):
                show(newUser: user)
            case let .failure(error):
                switch error {
                    case let .missingField(fieldId):
                        showAlert(withTitle: "Missing Field", message: "Field \(fieldId) is missing")
                }
        }
    }
    
    private func show(newUser user: User) {
        showAlert(withTitle: "Hi!", message: "\(user.name) \(user.lastName) \(user.email)")
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}
