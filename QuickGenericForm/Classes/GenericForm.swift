//
//  GenericForm.swift
//  QuickGenericForm
//
//  Created by Nicolas Frugoni on 10/12/2020.
//

import UIKit
import PureLayout

public class GenericForm: UIScrollView {
    public var formValidator: FormValidator?
    
    public var fields: [FormFieldView] = [] {
        didSet {
            reloadFields()
        }
    }
    
    public var isValid: Bool {
        guard let validator = formValidator else { return true }
        return validator.isFormFieldValid(fields, forGenericForm: self)
    }
    
    public func getValue<Generator: FormValueGenerator>(
        usingGenerator generator: Generator
    ) -> Result<Generator.FormValue, FormValueGeneratorError> {
        generator.buildDataFrom(form: self)
    }
    
    public var fieldSpacing: CGFloat {
        get { stackView.spacing }
        set { stackView.spacing = newValue }
    }
    
    public var padding: NSDirectionalEdgeInsets {
        get { stackView.directionalLayoutMargins }
        set { stackView.directionalLayoutMargins = newValue }
    }
    
    private let contentView = UIView(forAutoLayout: ())
    private let stackView = UIStackView(forAutoLayout: ())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        addSubview(contentView)
        contentView.addSubview(stackView)

        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: self)
        stackView.autoMatch(.width, to: .width, of: contentView)
        stackView.autoPinEdgesToSuperviewEdges()
    }
    
    private func updateLookAndFeel() {
    }
    
    private func reloadFields() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        fields.forEach { field in
            stackView.addArrangedSubview(field)
        }
    }
}
