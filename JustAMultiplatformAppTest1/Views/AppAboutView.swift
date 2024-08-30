//
//  AppAboutView.swift
//  VisitVerify
//
//  Created by Daryl Cox on 08/24/2024.
//  Copyright © DFW-PMA 2024. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
struct AppAboutView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "AppAboutView"
        static let sClsVers      = "v1.0603"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright © DFW-PMA 2024. All rights reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // App Data field(s):

//  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of init().

    var body: some View 
    {
        
        let _ = self.xcgLogMsg("...'AppAboutView(.swift):body'...")

        VStack
        {

            Spacer()

            HStack(alignment:.center)           // HStack #1.3
            {

                Spacer()

                Button("Dismiss") 
                {

                    let _ = xcgLogMsg("\(ClassInfo.sClsDisp):AppAboutView.Button(Xcode).'Dismiss' pressed...")

                    self.presentationMode.wrappedValue.dismiss()

                    //  dismiss()

                }
                .background(Color(red: 0.8784, green: 1.0, blue: 1.0))
                .foregroundColor(.accentColor)

            }   // End of HStack #1.1

            Spacer()

            if #available(iOS 17.0, *)
            {

                Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal)
                        { size, axis in
                            size * 0.15
                        }

            }
            else
            {

                Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                    .resizable()
                    .scaledToFit()
                    .frame(width:75, height: 75, alignment:.center)

            }

            Spacer()

            Text("\(JmXcodeBuildSettings.jmAppDisplayName)")
                .bold()
            Text("")
            Text("Application Category:")
                .bold()
                .italic()
            Text("\(JmXcodeBuildSettings.jmAppCategory)")

            Spacer(minLength:2)

            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                .italic()

            Spacer(minLength:4)

            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                .italic()

            Spacer()

        }
    //  .padding()
        
    }
    
    func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg("\(sMessage)")

        // Exit...

        return

    }   // End of func xcgLogMsg().

}

@available(iOS 13.0, *)
#Preview
{
    
    AppAboutView()
    
}

