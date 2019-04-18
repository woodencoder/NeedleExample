//
//  EditNoteComponent.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import NeedleFoundation

protocol EditNoteDependency: Dependency {
    var analyticsService: AnalyticsService { get }
    var notesService: NotesService { get }
}

protocol EditNoteBuilder {
    func editNoteViewControler(for note: Note) -> EditNoteViewController
}

class EditNoteComponent: Component<EditNoteDependency>, EditNoteBuilder {

    func editNoteViewControler(for note: Note) -> EditNoteViewController {
        return EditNoteViewController(note: note, notesService: dependency.notesService, analyticsService: dependency.analyticsService)
    }
}
