import SwiftUI

struct ContentView: View {
  
  private let episodes = Episode.episodesBySeason
  
  var body: some View {
    NavigationView {
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
      }.navigationBarTitle("Game of Thrones")
    }.navigationBarBackButtonHidden(false)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
