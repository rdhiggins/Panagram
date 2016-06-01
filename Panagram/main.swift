//
//  main.swift
//  Panagram
//
//  Created by Rodger Higgins on 5/31/16.
//  Copyright © 2016 Spazstik Software. All rights reserved.
//

import Foundation

let fromBlogArticle = "https://www.raywenderlich.com/128039/command-line-programs-os-x-tutorial?utm_campaign=Swift%252BSandbox&utm_medium=email&utm_source=Swift_Sandbox_42"

let panagram = Panagram()

if Process.argc < 2 {
    panagram.interactiveMode()
} else {
    panagram.staticMode()
}