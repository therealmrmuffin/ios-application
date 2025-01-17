//
//
// Raivo OTP
//
// Copyright (c) 2022 Tijme Gommers. All rights reserved. Raivo OTP
// is provided 'as-is', without any express or implied warranty.
//
// Modification, duplication or distribution of this software (in
// source and binary forms) for any purpose is strictly prohibited.
//
// https://github.com/raivo-otp/ios-application/blob/master/LICENSE.md
//

import SwiftUI

/// A filled button with a 'tint' background by default'
struct FilledButton: View {
    
    /// The text in the button
    let title: String
    
    /// The action to take on tap
    let action: () -> Void
    
    /// An progress indicator is shown if busy has a positive value
    @Binding var busy: Bool
    
    /// Initialize the button with a title, busy state and tab action
    ///
    /// - Parameter title: The text in the button
    /// - Parameter busy: Positive if a progress indicator should be shown
    /// - Parameter action: The action (closure) to execute on tab
    init(_ title: String, busy: Binding<Bool> = .constant(false), action: @escaping () -> Void) {
        self.title = title
        self.action = action
        _busy = busy
    }

    /// The body of the view
    var body: some View {
        Button(action: action) {
            HStack {
                ActivityIndicator(animate: $busy, color: .constant(.white))
                    .frame(width: busy ? nil : 0)
                Text(title)
                    .font(.system(size: 18))
                    .bold()
            }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(8)
                .disabled(busy)
        }
    }
}

/// A preview for the fileld button
struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledButton("Download") {}
    }
}
