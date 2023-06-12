//
//  CityListView.swift
//  Assignment3
//
//  Created by Angela Banks on 6/10/23.
//

import SwiftUI

struct CityListView: View {
    @ObservedObject var viewModel: CityListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.cities, id: \.name) { city in
                NavigationLink(destination: CityDetailsView(viewModel: CityDetailsViewModel(city: city))) {
                    Text(city.name)
                }
            }
            .navigationBarTitle("Popular Cities")
        }
    }
}

//struct CityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityListView(viewModel: CityListViewModel())
//    }
//}
