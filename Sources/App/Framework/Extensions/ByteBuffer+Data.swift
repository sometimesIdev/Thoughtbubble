//
//  ByteBuffer+Data.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor

public extension ByteBuffer {
	
	var data: Data? { getData(at: 0, length: readableBytes) }
}
