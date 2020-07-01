import SwiftUI

struct Cell {
  
  private let episode: Episode
  
  init(episode:Episode){
    self.episode = episode
  }
  
  var body: some View {
    Text(episode.name)
  }
}

struct Cell_Previews: PreviewProvider {
  static var previews: some View {
    /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
  }
}
