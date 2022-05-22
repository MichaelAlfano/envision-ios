//
//  ProfessionalsView.swift
//  Envision STEM
//
//  Created by Michael Arthur Alfano on 5/20/22.
//

import SwiftUI

struct ProfessionalsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let presenter: ProfessionalsViewPresenter
    
    @State var professionals: [ProfileCellData]
    @State var interests: Interests
    @State var filter: ProfessionalsViewPresenter.Filters = .all
    
    @State var searchText: String = String()
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        header
                            .id(0)
                        searchBar
                        content
                        backToTopButton(proxy)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
        .onTapGesture(perform: UIApplication.shared.endEditing)
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(Strings.Professionals.TITLE)
                    .styling(TextStyles.title1)
                proffessionalsSubtitle
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 18)
            .padding(.top, -30)
            Spacer()
        }
    }
    
    private var proffessionalsSubtitle: some View {
        HStack {
            Text(Strings.Professionals.SUBTITLE_ONE)
                .styling(TextStyles.footnote2)
            Button(action: {
                if interests.isComplete() {
                    Haptics.play(.light)
                    filter = .interests
                } else {
                    Haptics.notify(.error)
                    AlertHelper.showAlert(title: "No Interests Found", message: "Add your interests to use this filter.")
                }
            }, label: {
                Text(Strings.Professionals.SUBTITLE_TWO)
                    .styling(TextStyles.title3)
                    .padding(6)
                    .padding(.horizontal, 7)
                    .background(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(filter == .interests ? Colors.selectedFilter : Colors.unselectedFilter)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    )
            })
            .opacity(interests.isComplete() ? 1.0 : 0.1)
            .disabled(!interests.isComplete())
            Text(Strings.Professionals.SUBTITLE_THREE)
                .styling(TextStyles.footnote2)
            Button(action: {
                Haptics.play(.light)
                filter = .all
            }, label: {
                Text(Strings.Professionals.SUBTITLE_FOUR)
                    .styling(TextStyles.title3)
                    .padding(6)
                    .padding(.horizontal, 7)
                    .background(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(filter == .all ? Colors.selectedFilter : Colors.unselectedFilter)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    )
            })
        }
        .padding(.top, 16)
    }
    
    private var searchBar: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(SearchBarTextFieldStyle())
                .padding(.top, 10)
            if !searchText.isBlank {
                Button(action: {
                    withAnimation {
                        searchText = ""
                    }
                }, label: {
                    HStack {
                        Text("Clear search")
                            .styling(TextStyles.title3Dark)
                        Spacer()
                        Image(systemName: "xmark")
                            .foregroundColor(Color.white)
                    }
                    .padding(5)
                    .padding(.leading, 14)
                    .padding(.trailing, 7)
                    .padding(.vertical, 7)
                    .background(Colors.primary)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                })
                .padding(.top, 3)
                .padding(.bottom, 8)
            }
        }
    }
    
    func hasAnyMatching() -> Bool {
        for professional in professionals {
            if professional.interests.contains(interests) {
                return true
            }
        }
        return false
    }
    
    private var content: some View {
        VStack {
            if (filter == .all || hasAnyMatching()) && professionals.containingSearch(searchText).count > 0 {
                ForEach(professionals.containingSearch(searchText)) { professional in
                    if filter == .all || professional.interests.contains(interests) {
                        NavigationLink(
                            destination: Profile(id: professional.id),
                            label: {
                                ProfessionalsCell(
                                    photo: professional.image,
                                    title: professional.title,
                                    subtitle: professional.subtitle,
                                    paragraph: professional.paragraph
                                )
                            }
                        )
                        .buttonStyle(Scale())
                    }
                }
            } else {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .frame(width: 55, height: 50)
                            .scaledToFit()
                            .padding(.top, 38)
                        Text("No Results")
                            .styling(TextStyles.title2)
                            .padding(.top, 4)
                            .padding(.bottom, 48)
                    }
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Colors.secondary)
                        .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
                )
                .padding(.horizontal, 16)
            }
        }
    }
    
    private func backToTopButton(_ proxy: ScrollViewProxy) -> some View {
        Button(action: {
            withAnimation {
                proxy.scrollTo(0, anchor: .top)
            }
        }, label: {
            HStack {
                Text("Back to top")
                    .styling(TextStyles.title3Dark)
                Image(AppAssets.Icons.chevronWhite)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .rotationEffect(.degrees(-90))
            }
            .padding(5)
            .padding(.leading, 14)
            .padding(.trailing, 3)
            .background(Colors.primary)
            .cornerRadius(8)
        })
        .padding(.top, 40)
    }
}

extension Array where Element == ProfileCellData {
    func containingSearch(_ searchText: String) -> [ProfileCellData] {
        if searchText.isBlank { return self }
        var returnValues: [ProfileCellData] = []
        for professional in self {
            if professional.containsAttributes(searchText) {
                returnValues.append(professional)
            }
        }
        return returnValues
    }
}

extension ProfileCellData {
    func containsAttributes(_ attribute: String) -> Bool {
        let localAttribute = attribute.lowercased()
        return
            self.title.lowercased().contains(localAttribute) ||
            self.subtitle.lowercased().contains(localAttribute) ||
            self.paragraph.lowercased().contains(localAttribute) ||
            self.interests.fields
                .map({ $0.lowercased() })
                .contains(where: { $0.contains(localAttribute) }) ||
            self.interests.career
                .map({ $0.lowercased() })
                .contains(where: { $0.contains(localAttribute) })
    }
}
