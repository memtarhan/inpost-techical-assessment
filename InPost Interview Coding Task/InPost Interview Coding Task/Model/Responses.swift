//
//  Responses.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation

protocol APIResponse: Decodable { }

struct PackResponse: APIResponse {
    let id: String
    let status: PackStatus // TODO: Change it to PackStatus
    let sender: String
    let expiryDate: Date?
    let pickupDate: Date?
    let storedDate: Date?
    let shipmentType: String
}

enum PackStatus: String, APIResponse {
    case CREATED
    case CONFIRMED
    case ADOPTED_AT_SOURCE_BRANCH
    case SENT_FROM_SOURCE_BRANCH
    case ADOPTED_AT_SORTING_CENTER
    case SENT_FROM_SORTING_CENTER
    case OTHER
    case DELIVERED
    case RETURNED_TO_SENDER
    case AVIZO
    case OUT_FOR_DELIVERY
    case READY_TO_PICKUP
    case PICKUP_TIME_EXPIRED
    case NOT_READY
    case BROKEN_STATUS
}

extension Array where Element: APIResponse {
}
