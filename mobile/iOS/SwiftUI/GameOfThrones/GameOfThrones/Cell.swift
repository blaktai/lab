import SwiftUI

struct Cell: View {
  
  private let episode: Episode
  private let align: Alignment
  init(episode:Episode, align:Alignment = .left){
    self.episode = episode
    self.align = align
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

extension Cell {
  enum Alignment {
    case left
    case right
  }
}
struct Cell_Previews: PreviewProvider {
  static var previews: some View {
    Cell(episode: Episode.allEpisodes.first!)
  }
}
