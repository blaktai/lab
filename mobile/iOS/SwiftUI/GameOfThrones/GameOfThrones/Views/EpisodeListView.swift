import SwiftUI

struct EpisodeListView: View {
  
  init(withNavigation: Bool){
    self.withNavigation = withNavigation
  }
  private let withNavigation: Bool
  private let episodes = Episode.episodesBySeason
  var body: some View {
    List {
      ForEach(0..<episodes.count) { seasonIndex in
        Section(header: Text("Season \(seasonIndex + 1)")) {
          EpisodeSeasonView(season: self.episodes[seasonIndex],
                            withNavigation: self.withNavigation)
          }
        }
      }
    }
}


struct EpisodeSeasonView: View {
  
  init(season: Season, withNavigation: Bool = true){
    self.season = season
    self.withNavigation = withNavigation
  }
  
  typealias Season = [Episode]
  private let season: Season
  private let withNavigation: Bool
  var body: some View {
    ForEach(0..<season.count) { episodeIndex  in
      if self.withNavigation {
        NavigationLink(destination: DetailView(self.season[episodeIndex])) {
          Cell(self.season[episodeIndex])
        }
      } else {
        Cell(self.season[episodeIndex])
      }
    }
  }
}


struct EpisodeList_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeListView(withNavigation: true)
  }
}
