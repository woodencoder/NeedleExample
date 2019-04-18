//
//  NotesService.swift
//  NeedleExample
//
//  Created by Klimenko Vladislav Sergeevich on 17/04/2019.
//  Copyright © 2019 Klimenko Vladislav Sergeevich. All rights reserved.
//

import Foundation

protocol NotesService: AnyObject {
    func getNotes() -> [Note]
}

class NotesServiceImp: NotesService {

    func getNotes() -> [Note] {
        return (1...10).map { Note(title: "Note #\($0)", description: "Description #\($0)") }
    }

}
