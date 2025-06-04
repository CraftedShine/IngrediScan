import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maximumRating: Int = 5
    var onColor = Color.yellow
    var offColor = Color.gray

    var body: some View {
        HStack(spacing: 8) {
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: number <= rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(number <= rating ? onColor : offColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

struct FilterView: View {
    @Environment(\.dismiss) var dismiss
    @State private var rating: Int = 0
    @State private var minCalories: Double = 0
    @State private var maxCalories: Double = 5000
    @State private var selectedSort: String = "Task"
    @State private var showFavorites = true
    
    let sortOptions = ["Calories", "Rating", "Duration", "Difficulty"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // MARK: Sort by
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sort by")
                        .font(.headline .bold() .smallCaps())
                        .padding(.top)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 2), spacing: 12) {
                        ForEach(sortOptions, id: \.self) { option in
                            Button(action: {
                                selectedSort = option
                            }) {
                                Text(option)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(selectedSort == option ? Color.blue.opacity(0.1) : Color(.systemGray6))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedSort == option ? Color.blue : Color.clear, lineWidth: 2)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Rating")
                    Spacer()
                    StarRatingView(rating: $rating)
                }
                
                HStack {
                    Text("Calories")
                    
                    Spacer()
                    
                    TextField("", value: $minCalories, formatter: NumberFormatter())
                        .frame(width: 75)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                    Text("to")
                    
                    TextField("", value: $maxCalories, formatter: NumberFormatter())
                        .frame(width: 75)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                    
                }
                
                Toggle("Show Favorites", isOn: $showFavorites)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                
                Spacer()
                
                // MARK: Show Recipes Button
                Button(action: {
                    // Do something
                    dismiss()
                }) {
                    Text("Show Recipes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 16)
            }
            .padding()
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Reset") {
                        // Reset logic
                        selectedSort = "Calories"
                        showFavorites = false
                    }
                }
            }
        }
    }
}

#Preview {
    FilterView()
}
