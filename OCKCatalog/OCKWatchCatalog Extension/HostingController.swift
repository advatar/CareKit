/*
 Copyright (c) 2020, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3. Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
import CareKit
import CareKitStore
import SwiftUI
import WatchKit

class HostingController: WKHostingController<ContentView> {
    @Environment(\.storeManager) private var storeManager

    override var body: ContentView {
        ContentView() //controller: OCKSimpleTaskController(storeManager: storeManager))
    }
}

/*
struct ContentView: View {

    // Observe the view model in the controller.
    @ObservedObject var controller: OCKSimpleTaskController

    // Define an event for convenience.
    var event: OCKAnyEvent? {

        controller.viewModel?.detail.e
            //.value?.firstEvent
        //controller.task
        //controller.taskEvents
        //.value?.firstEvent
    }

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(event?.task.title ?? "")
            Button(action: {
                let isComplete = self.event?.outcome != nil
                self.controller.setEvent(atIndexPath: IndexPath(row: 0, section: 0), isComplete: !isComplete, completion: nil)
            }) {
                self.event?.outcome != nil ? Text("Mark as Completed") : Text("Completed")
            }
        }
    }
}
*/

struct ContentView: View {

    @Environment(\.storeManager) private var storeManager

    @ViewBuilder var body: some View {
        if #available(watchOS 7, *) {
            VStack(spacing: 16) {
                SimpleTaskView(taskID: "doxylamine", eventQuery: .init(for: Date()), storeManager: storeManager)
                InstructionsTaskView(taskID: "doxylamine", eventQuery: .init(for: Date()), storeManager: storeManager)
            }
        }
    }
}
