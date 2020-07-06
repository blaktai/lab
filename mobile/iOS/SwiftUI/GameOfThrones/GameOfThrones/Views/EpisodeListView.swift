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
          ForEach(0..<self.episodes[seasonIndex].count) { episodeIndex  in
            NavigationLink(destination: DetailView( self.episodes[seasonIndex][episodeIndex])) {
              Cell(self.episodes[seasonIndex][episodeIndex])
            }
          }
        }
      }
    }
  }
}


struct EpisodeList_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeListView(withNavigation: true)
  }
}
