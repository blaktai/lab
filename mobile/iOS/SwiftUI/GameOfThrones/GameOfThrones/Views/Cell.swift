import SwiftUI

struct Cell: View {
  
  private let episode: Episode
  private let align: Alignment
  init(_ episode:Episode, align:Alignment = .left){
    self.episode = episode
    self.align = align
  }
  
  private var ImageView: some View {
    Image(episode.originalImageID)
      .resizable()
      .aspectRatio(contentMode: .fit)
  }
  
  private var EpisodeMetaDataView: some View {
    VStack {
      Text(episode.name)
      Text(episode.airdate)
    }.frame(maxWidth: 100)
  }
  
  var body: some View {
    HStack {
      if align == .left {
        ImageView
        EpisodeMetaDataView
      } else {
        EpisodeMetaDataView
        ImageView
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
    Cell(Episode.allEpisodes.first!)
  }
}
