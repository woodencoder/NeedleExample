//
//  EditNoteViewController.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {

    private let analyticsService: AnalyticsService
    private let notesService: NotesService
    private let note: Note

    private let stackView: UIStackView = UIStackView()
    private let titleTextField: UITextField = UITextField()
    private let detailsTextField: UITextField = UITextField()

    init(note: Note, notesService: NotesService, analyticsService: AnalyticsService) {
        self.note = note
        self.notesService = notesService
        self.analyticsService = analyticsService

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        analyticsService.sendAnalytics(for: AnalyticsEvent(name: "Editing started"))
        setupSubviews()
    }


    func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(detailsTextField)

        titleTextField.text = note.title
        titleTextField.borderStyle = .roundedRect
        detailsTextField.text = note.description
        detailsTextField.borderStyle = .roundedRect

        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }



}
