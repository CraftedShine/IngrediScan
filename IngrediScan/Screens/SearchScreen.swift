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
    @State private var scrollProxy: ScrollViewProxy?
    
    @StateObject var viewModel: ViewModel
    @State var resultList: [Recipe] = []
    let fridge: MyFridge
    
    var body: some View {
        NavigationView{
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        
                        //Search
                        SearchForm(searchResult: $resultList, recipeList: viewModel.recipes, fridge: fridge, onButtonPress: {withAnimation {
                            scrollProxy?.scrollTo("Result", anchor: .top)
                        }})
                            .frame(height: 750)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.05)))
                            .id("topBox")
                        
                        Text("Result")
                            .font(.title)
                            .padding(.top, 30)
                            .id("Result")
                        
                        //Result
                        ForEach(resultList) { recipe in
                            RecipeCard(recipe: bindingForRecipe(recipe))
                        }
                    }
                }
                .onAppear {
                    scrollProxy = proxy
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rezept Suche")
                        .font(.title .bold() .smallCaps())
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        withAnimation {
                            scrollProxy?.scrollTo("topBox", anchor: .top)
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(Color.orange.opacity(0.75))
                            .clipShape(Circle())
                    }
                }
            }
        }
        
    }
    
    func bindingForRecipe(_ recipe: Recipe) -> Binding<Recipe> {
        guard let index = viewModel.recipes.firstIndex(where: { $0.id == recipe.id }) else {
            return .constant(recipe)
        }
        return $viewModel.recipes[index]
    }
}

#Preview {
    SearchScreen(viewModel: ViewModel(), fridge: MockFridge())
}

