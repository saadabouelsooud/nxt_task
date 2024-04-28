import UIKit
import SwiftUI

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "native_channel"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if let flutterViewController = window?.rootViewController as? FlutterViewController {
            let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: flutterViewController.binaryMessenger)

           methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "showBottomSheet" {
                 if let arguments = call.arguments as? [String: Any], let body = arguments["body"] as? String {
                     let success = self?.showBottomSheetFromNative(body)
                     result(success)
                 } else {
                     // Handle the case where "body" argument is missing or not a String
                     result(FlutterError(code: "argument_error", message: "Invalid arguments", details: nil))
                 }
            } else {
                result(FlutterMethodNotImplemented)
            }
           }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func showBottomSheetFromNative(_ body: String?) -> Bool {
        print(body)
        if let jsonData = body?.data(using: .utf8) {
            do {
                let tickets = try JSONDecoder().decode([Ticket?].self, from: jsonData)
                for ticket in tickets {
                    if let ticket = ticket {
                        print(ticket)
                        // Display SwiftUI bottom sheet
                        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                            let fullName = "\(ticket.ticketUser!.firstName) \(ticket.ticketUser!.lastName)"
                            let rootView = BottomSheetView(sheetBody: body, avatar: ticket.ticketUser!.avatar, name: fullName, ticketSystemId: ticket.ticketSystemId, seat: ticket.seat, ticketType: ticket.ticketTypeName)
                            appDelegate.window?.rootViewController?.present(UIHostingController(rootView: rootView), animated: true, completion: nil)
                            return true
                        }
                    } else {
                        print("Null ticket")
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        return false
    }
}

// SwiftUI view for bottom sheet
struct BottomSheetView: View {
    let sheetBody: String?
    
    let avatar: URL
    let name: String
    let ticketSystemId: String
    let seat: String
    let ticketType: String
    

    var body: some View {
        ZStack {
            Color.clear // Transparent background
            
            VStack(alignment: .leading, spacing: 16) { // Align content to the left
                HStack{
                    AsyncImage(url: avatar) { phase in
                                           switch phase {
                                               case .success(let image):
                                                   image
                                                       .resizable()
                                                       .aspectRatio(contentMode: .fill)
                                                       .frame(width: 60, height: 60)
                                                       .clipShape(Circle())
                                               case .failure(_):
                                                   // Handle failure, e.g., show a fallback image or view
                                                   Image(systemName: "person.circle.fill")
                                                       .resizable()
                                                       .aspectRatio(contentMode: .fill)
                                                       .frame(width: 60, height: 60)
                                                       .clipShape(Circle())
                                               case .empty:
                                                   // Placeholder while loading
                                               Image(systemName: "person.circle.fill")
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fill)
                                                   .frame(width: 60, height: 60)
                                                   .clipShape(Circle())
                                           }
                                       }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(ticketSystemId)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                // Dotted divider
                               Divider().background(
                                   GeometryReader { geometry in
                                       Rectangle()
                                           .fill(Color.white)
                                           .frame(width: geometry.size.width, height: 2)
                                           .opacity(0.5) // Adjust opacity as needed
                                           .overlay(
                                               VStack {
                                                   Spacer().frame(width: geometry.size.width, height: 1)
                                                   HStack(spacing: 3) {
                                                       ForEach(0..<Int(geometry.size.width / 4)) { _ in
                                                           Rectangle()
                                                               .fill(Color.white)
                                                               .frame(width: 4, height: 1)
                                                       }
                                                   }
                                                   Spacer().frame(width: geometry.size.width, height: 1)
                                               }
                                           )
                                   }
                               )
                
                HStack{
                    Text("Ticket Type:")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(ticketType)
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                HStack{
                    Text("Seat:")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(seat)
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                Spacer() // Push content to the top
            }
            .background(Color(red: 233/255, green: 233/255, blue: 233/255)) // Background color #E9E9E9
            .cornerRadius(10)
            .padding(.horizontal) // Add horizontal padding
            
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            // Dismiss the bottom sheet on tap
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
