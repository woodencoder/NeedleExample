//
//  NotesComponent.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import NeedleFoundation


protocol NotesDependency: Dependency {
    var notesService: NotesService { get }
    var logger: Logger { get }
    var noteDetailsBuilder: NotesDetailsBuilder { get }
}

class NotesComponent: Component<NotesDependency> {
    var notesController: NotesViewController { return NotesViewController(notesService: dependency.notesService,
                                                                          logger: dependency.logger,
                                                                          noteDetailBuilder: dependency.noteDetailsBuilder) }
}
