//
//  ViewController.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 15/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import UIKit
import NeedleFoundation

class NotesViewController: UIViewController {

    private let logger: Logger
    private let notesService: NotesService
    private let noteDetailBuilder: NotesDetailsBuilder

    private var notes: [Note] = []
    private var tableView: UITableView = UITableView()

    init(notesService: NotesService, logger: Logger, noteDetailBuilder: NotesDetailsBuilder) {
        self.notesService = notesService
        self.logger = logger
        self.noteDetailBuilder = noteDetailBuilder

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logger.logMessage("NotesViewController did load")
        notes = notesService.getNotes()

        setupSubviews()
    }

    func setupSubviews() {
        view.addSubview(tableView)
        view.backgroundColor = .white

        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "kNoteCell")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension NotesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kNoteCell", for: indexPath)

        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].description

        return cell
    }

}

extension NotesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        let noteDetailsViewController = noteDetailBuilder.noteDetailsViewController(for: note)

        navigationController?.pushViewController(noteDetailsViewController, animated: true)
    }
}

