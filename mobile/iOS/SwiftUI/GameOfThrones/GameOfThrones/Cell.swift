import SwiftUI

struct Cell: View {
  
  private let episode: Episode
  
  init(episode:Episode){
    self.episode = episode
  }
  
  var body: some View {
    HStack {
      Image(episode.originalImageID)
        .resizable()
        .scaledToFit()
      VStack {
        Text(episode.name)
        Text(episode.airdate)
      }
    }
  }
}

struct Cell_Previews: PreviewProvider {
  static var previews: some View {
    Cell(episode: Episode.allEpisodes.first!)
  }
}
