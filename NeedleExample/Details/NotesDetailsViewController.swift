//
//  NotesDetailsViewController.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController {

    private let logger: Logger
    private let notesService: NotesService
    private let note: Note
    private let editNoteBuilder: EditNoteBuilder

    private let stackView: UIStackView = UIStackView()
    private let titleLabel: UILabel = UILabel()
    private let detailsLabel: UILabel = UILabel()

    init(note: Note, notesService: NotesService, logger: Logger, editNoteBuilder: EditNoteBuilder) {
        self.note = note
        self.notesService = notesService
        self.logger = logger
        self.editNoteBuilder = editNoteBuilder

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logger.logMessage("NoteDetailsViewController did load")

        setupSubviews()
    }

    func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailsLabel)

        titleLabel.text = note.title
        detailsLabel.text = note.description

        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didPressEdit(_:)))
        navigationItem.rightBarButtonItem = editButton
    }

    @objc private func didPressEdit(_ sender: Any) {
        let editNoteViewController = editNoteBuilder.editNoteViewControler(for: note)
        navigationController?.pushViewController(editNoteViewController, animated: true)
    }
    
}
