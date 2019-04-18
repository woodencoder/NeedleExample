//
//  NoteDetailsComponent.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import NeedleFoundation


protocol NotesDetailsBuilder {
    func noteDetailsViewController(for note: Note) -> NoteDetailsViewController
}

protocol NoteDetailsDependency: Dependency {
    var notesService: NotesService { get }
    var logger: Logger { get }
    var editNoteBuilder: EditNoteBuilder { get }
}

class NoteDetailsComponent: Component<NoteDetailsDependency>, NotesDetailsBuilder {

    func noteDetailsViewController(for note: Note) -> NoteDetailsViewController {
        return NoteDetailsViewController(note: note,
                                         notesService: dependency.notesService,
                                         logger: dependency.logger,
                                         editNoteBuilder: dependency.editNoteBuilder)
    }
    
}
