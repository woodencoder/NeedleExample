//
//  RootComponent.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import NeedleFoundation

class RootComponent: Component<EmptyDependency> {

    init() {
        super.init(parent: BootstrapComponent())
    }

    var logger: Logger {
        return ConsoleLogger()
    }

    var notesService: NotesService {
        return NotesServiceImp()
    }

    var notesComponent: NotesComponent {
        return NotesComponent(parent: self)
    }

    var editNoteBuilder: EditNoteBuilder {
        return EditNoteComponent(parent: self)
    }

    var noteDetailsBuilder: NotesDetailsBuilder {
        return NoteDetailsComponent(parent: self)
    }

    var analyticsService: AnalyticsService {
        return SimpleAnalyticsService()
    }
}
