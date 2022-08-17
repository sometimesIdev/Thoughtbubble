# Thoughtbubble
Modular Swift Server code (part of a CMS) 

This code is the result of being interested in having another look at Swift 
on the server. Initially I found 3 tools to work with Swift ont the Server

 - Vapor (open source started by Tanner Nelson & Logan Wright)
 - Kitura (By IBM)
 - Perfect
 
 These 3 are server frameworks. Kitura, although I thought it was good, is no longer maintained.
 
 Soon after I found these 3, Apple released the first version of SwiftNIO
 
 At the start of 2022 I saw on the Vapor Discord that Tibor Bodecs had written a new book that included some
 more modern language features of Swift (specifically I was interested in seening async/await concurrency 
 features used) so I bought his book [Practical Server Side Swift](https://theswiftdev.gumroad.com) 
 
 The code in here is the result of reading the book.
 
 It is a small portion of what I imagine Tibor's Feather CMS was based on. Its a Protcol oriented 
 archtecture with modules for injecting different data types to the CMS
 
 This code is not 100% complete, but does show the power of the Swift language and has some interesting
 features.
 
 If you want to try this code out please feel free, just be aware that not all of the links have been fully 
 implemented.
 
 This version does have the following features
 
  - It uses Tibor's SwiftHTML DSL for rendering web pages
  - Fluent as the ORM for working with the sqllite database backend
  - Sessions & user authentication 
  - Form events and async validation
  - a generic admin interface
  - a basic REST API
  - API protection & validation
  - Testing
  - Event driven hooks
  
 I found it an interesting read and learned quite a bit about different ways of thinking & how to 
 architect a project. At some later time I might try to use Feather CMS on a personal project.
 
 I hope he does a revision of this book at some point once the Regex features of Swift come out of beta.
 
 It was certainly different than the Ray Wenderlich book written by Tim Condon (I hope they do another edition
 of their book as well.)
 
 
  
