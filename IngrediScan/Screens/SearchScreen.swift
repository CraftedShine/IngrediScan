//
//  SearchScreen.swift
//  IngrediScan
//
//  Created by Jan Keller on 14.05.25.
//


// create swift data for fridge
// refactor local data structures

import SwiftUI

struct SearchScreen: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var scrollProxy: ScrollViewProxy?
    @State private var searchFormVisible: Bool = true
    
    var resultList: [Recipe] {
        searchViewModel.searchResult
    }
    
    var body: some View {
        NavigationView{
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        if resultList.isEmpty {
                            Text("Keine Rezepte gefunden")
                                .font(.callout .bold() .smallCaps())
                                .foregroundStyle(.secondary)
                        }
                        //Result
                        ForEach(resultList) { recipe in
                            RecipeCard(recipe: recipe)
                        }
                    }
                }
                .sheet(isPresented: $searchFormVisible) {
                    ScrollView {
                        SearchForm(onButtonPress: {
                            withAnimation {
                                scrollProxy?.scrollTo("Result", anchor: .top)
                                dismiss()
                            }
                        })
                        .frame(height: 700)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.05)))
                        .id("topBox")
                        .padding(.top)
                        .presentationCornerRadius(16)
                        .presentationBackgroundInteraction(.enabled)
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.fraction(0.125), .large])
                    }
                }
                .onAppear {
                    scrollProxy = proxy
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rezepte")
                        .font(.title .bold() .smallCaps())
                }
                ToolbarItem(placement: .confirmationAction) {
                    CircularButton(size: 20, padding: 10, color: .orange, image: "magnifyingglass") {
                        searchFormVisible.toggle()
                    }
                }
            }
        }
        
    }
}

#Preview {
    SearchScreen()
        .withPreviewEnvironmentObjects()
}

