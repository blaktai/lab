import SwiftUI

struct DetailView: View {
  
  private let episode: Episode
  
  init(episode:Episode){
    self.episode = episode
  }
  
  var body: some View {
    VStack(alignment: .center, spacing: 7.0){
      Image(episode.originalImageID)
        .resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch)
      HStack {
        Text(episode.airdate)
        Text(episode.name)
      }.aspectRatio(contentMode: .fit)
    }
    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(episode: Episode.allEpisodes.first!)
  }
}
