import Foundation

struct Episode {
    let airdate: String
    let id: Int
    let name: String
    let number: Int
    let season: Int
    let runtime: Int
    let summary: String
    let mediumImageID: String
    let originalImageID: String
    init(airdate: String, id: Int, name: String, number: Int, season: Int, runtime: Int, summary: String, mediumImageID: String, originalImageID: String) {
        self.airdate = airdate
        self.id = id
        self.name = name
        self.number = number
        self.season = season
        self.runtime = runtime
        self.summary = summary
        self.mediumImageID = mediumImageID
        self.originalImageID = originalImageID
    }
}
