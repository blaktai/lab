import SwiftUI

struct ContentView: View {
  
  private let episodesBySeason = Episode.episodesBySeason
  
  var body: some View {
    List {
      ForEach(0..<episodesBySeason.count) { index in
        Section(header: Text("Season \(index + 1)")) {
          ForEach(0..<self.episodesBySeason[index].count, id: \.self) { episodeIndex in
            Cell(episode: self.episodesBySeason[index][episodeIndex],
                 align: index % 2 == 0 ? .left : .right )
          }
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
