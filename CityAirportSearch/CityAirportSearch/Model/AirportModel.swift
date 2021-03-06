// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let airportResponse = try? newJSONDecoder().decode(AirportModel.self, from: jsonData)

import Foundation

struct AirportModel: Codable {
    let code, lat, lon, name: String?
    let city, state, country, woeid: String?
    let tz, phone, type, email: String?
    let url, runwayLength, elev, icao: String?
    let directFlights, carriers: String?

    enum CodingKeys: String, CodingKey {
        case code, lat, lon, name, city, state, country, woeid, tz, phone, type, email, url
        case runwayLength = "runway_length"
        case elev, icao
        case directFlights = "direct_flights"
        case carriers
    }
}

extension AirportModel: Equatable {
    
    static func == (lhs: AirportModel, rhs: AirportModel) -> Bool {
        return lhs.code == rhs.code
    }
}

extension AirportModel: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
}


typealias AirportsResponse = [AirportModel]
