//
//  JustAMultiplatformAppTest1AppGlobalInfo.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/25/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct AppGlobalInfo
{
    
    static let sGlobalInfoAppId:String        = "JustAMultiplatformAppTest1"
    static let sGlobalInfoAppVers:String      = "v1.0501"
    static let sGlobalInfoAppDisp:String      = sGlobalInfoAppId+".("+sGlobalInfoAppVers+"): "
    static let sGlobalInfoAppCopyRight:String = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
    static let sClsLogFilespec:String         = "JustAMultiplatformAppTest1.log"

    static let bUseApplicationShortTitle:Bool = false
    static let sApplicationTitle:String       = "-N/A-"
    static let sApplicationShortTitle:String  = "JAMpAT1"

#if os(macOS)

    static let sHelpBasicFileExt:String       = "html"     // 'help' File extension: "md", "html", or "txt"

#elseif os(iOS)

    static let sHelpBasicFileExt:String       = "md"       // 'help' File extension: "md", "html", or "txt"

#endif
    
}

