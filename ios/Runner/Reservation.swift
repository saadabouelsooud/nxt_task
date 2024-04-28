//
//  Reservation.swift
//  Runner
//
//  Created by Macbook on 28/04/2024.
//

import Foundation
struct TicketUser: Codable {
    let firstName: String
    let lastName: String
    let avatar: URL // Assuming avatar is a URL
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        // Decode avatar as URL
        var avatarString = try container.decode(String.self, forKey: .avatar)
        avatar = URL(string: avatarString)!
    }
}


// Define a model for Ticket
struct Ticket: Decodable {
    let ticketId: Int
    let seat: String
    let ticketSystemId: String
    let ticketTypeName: String
    let ticketUser: TicketUser?
    let gate: String

    private enum CodingKeys: String, CodingKey {
        case ticketId = "ticket_id"
        case seat
        case ticketSystemId = "ticket_system_id"
        case ticketTypeName = "ticket_type_name"
        case ticketUser = "ticket_user_data"
        case gate
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        ticketId = try container.decode(Int.self, forKey: .ticketId)
        seat = try container.decode(String.self, forKey: .seat)
        ticketSystemId = try container.decode(String.self, forKey: .ticketSystemId)
        ticketTypeName = try container.decode(String.self, forKey: .ticketTypeName)
        ticketUser = try container.decode(TicketUser.self, forKey: .ticketUser)
        gate = try container.decode(String.self, forKey: .gate)
    }
}

