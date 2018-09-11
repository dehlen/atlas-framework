//
//  MVVMCModelObserver.swift
//  iosBasicLibrary
//
//  Created by Olbrich, Jan Torben on 20.02.17.
//  Copyright © 2017 FILIADATA GmbH. All rights reserved.
//

public protocol MVVMCModelObserver: class {
    func modelDidChange(model: MVVMCModelProtocol)
}
