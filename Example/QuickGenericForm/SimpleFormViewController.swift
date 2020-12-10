//
//  SimpleFormViewController.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 12/10/2020.
//  Copyright (c) 2020 Nicolas Frugoni. All rights reserved.
//

import UIKit
import QuickGenericForm

class SimpleFormViewController: UIViewController {

    @IBOutlet weak var form: GenericForm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        form.formValidator = DefaultFormValidator()
        form.padding = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
        form.fieldSpacing = 8
        form.fields = [
            makeField(id: "name", placeholder: "Name"),
            makeField(id: "address", placeholder: "Address"),
            makeField(id: "number", placeholder: "Address Number"),
            makeField(id: "phone", placeholder: "Phone Number")
        ]
    }

    private func makeField(
        id: String,
        placeholder: String,
        validations: [GenericFormFieldValidationRule] = [RequiredFieldValidation()]
    ) -> FormFieldView {
        let field = TextFormField(id: id)
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
        switch form.getValue(usingGenerator: AddressValueGenerator()) {
            case let .success(address):
                show(newAddress: address)
            case let .failure(error):
                switch error {
                    case let .missingField(fieldId):
                        showAlert(withTitle: "Missing Field", message: "Field \(fieldId) is missing")
                }
        }
    }
    
    private func show(newAddress address: Address) {
        showAlert(withTitle: "Hi!", message: "\(address.name) \(address.address) \(address.phone)")
    }
    
    private func showAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}

class AddressValueGenerator: FormValueGenerator {
    typealias FormValue = Address
    
    func buildDataFrom(form: GenericForm) -> Result<Address, FormValueGeneratorError> {
        guard let name = form.fields.first(where: { $0.id == "name" })?.value
        else { return .failure(.missingField("name")) }
        guard let address = form.fields.first(where: { $0.id == "address" })?.value
        else { return .failure(.missingField("address")) }
        guard let phone = form.fields.first(where: { $0.id == "phone" })?.value
        else { return .failure(.missingField("phone")) }
        guard let number = form.fields.first(where: { $0.id == "number" })?.value
        else { return .failure(.missingField("number")) }
        
        return .success(
            Address(
                name: name,
                address: address,
                phone: phone,
                number: number
            )
        )
    }
}

struct Address {
    let name: String
    let address: String
    let phone: String
    let number: String
}
