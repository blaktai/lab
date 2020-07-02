import SwiftUI

struct DetailView: View {
  
  private let episode: Episode
  
  init(_ episode:Episode){
    self.episode = episode
  }
  
  var body: some View {
    VStack(alignment: .center, spacing: 7.0){
      Image(episode.mediumImageID)
        .resizable()
        .frame(minHeight: 400)
      VStack {
        Text(episode.airdate)
        Spacer(minLength: 25)
        Text(episode.name)
      }.aspectRatio(contentMode: .fit)
    }
    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(Episode.allEpisodes.first!)
  }
}
