//
//  File+ByteBuffer.swift
//  
//
//  Created by Pat Butler on 2022-02-25.
//

import Vapor

public extension File {
	
	var byteBuffer: ByteBuffer { data }
}
