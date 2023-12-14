//
//  ContentView.swift
//  iCutApp
//
//  Created by Leandro Morais on 04/11/23.
//

import SwiftUI

struct ContentView: View {

	@Environment(\.colorScheme) var colorScheme

	var body: some View {
		NavigationStack {
			List() {

				//MARK: MAPA LOCAL
				ExtractedView_MAP()

				//MARK: CORTES
				ExtractedView_CORTES()

				//MARK: TRATAMENTO CAPILAR
				ExtractedView_TRATAMENTOCAPILAR()

				//MARK: CUIDADOS DAS UNHAS
				ExtractedView_UNHAS()

				//MARK: CUIDADOS DA PELE
				ExtractedView_PELE()

				//MARK: DEPILACAO
				ExtractedView_DEPIL()
			}
			.listStyle(.inset)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle("Início")
		}
		.scrollIndicators(.hidden)
	}
}

// MARK: GLASSMORPHISM
struct FlatGlassView : ViewModifier {
	func body(content: Content) -> some View {
		if #available(iOS 15.0, *) {
			content
				.padding()
				.frame(height: 50)
				.background(.ultraThinMaterial.opacity(1))
				.cornerRadius(14)
		} else {
			// Fallback on earlier versions
			content
				.padding()
				.frame(height: 50)
				.cornerRadius(25)
		}
	}
}
// MARK: IMAGE
struct ImageModifier: ViewModifier {

	func body(content: Content) -> some View {
		content
		//.resizable()
			.scaledToFit()
			.cornerRadius(20.0)
	}
}

// MARK: TEXT
struct TextModifier: ViewModifier {
	@Environment(\.colorScheme) var colorScheme
	func body(content: Content) -> some View {
		content
			.fontWeight(.heavy)
			.padding(.horizontal, 15)
			.padding(.top, 4)
			.padding(.bottom, 4)
			.background(colorScheme == .light ? .white.opacity(0.9) : .black.opacity(0.9))
			.cornerRadius(14.0)
			.offset(CGSize(width: -0.0, height: 92.0))
			.foregroundColor(colorScheme == .light ? .black.opacity(0.9) : .white.opacity(0.9))
			.font(.title3)
	}
}

//MARK: Preview
#Preview {
	ContentView()
}


struct ExtractedView_MAP: View {
	var body: some View {
		Section(header: Text("Mapa local").font(.title3).fontWeight(.bold)) {
			NavigationLink(destination: MapView(title: "Escolha um estabelecimento próximo")) {
				Image(systemName: "mappin.and.ellipse")
					.foregroundColor(Color.red)
					.symbolEffect(.pulse)
					.padding(.horizontal, 30)
				Text("Locais próximos")
			}
			.font(.system(size: 25, weight: .medium))
			.frame(maxWidth: .infinity)
			.foregroundColor(.blue)
			.padding(.trailing)
		}
	}
}

struct ExtractedView_CORTES: View {
	var body: some View {
		Section(header: Text("Corte de cabelo").font(.title2).fontWeight(.bold)) {
			NavigationLink(destination: CorteMasculino(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("corteMasculino").resizable()
							.modifier(ImageModifier())

						Text("Masculino")
							.modifier(TextModifier())
					}
				}
			}

			NavigationLink(destination: CorteFeminino(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("corteFeminino").resizable()
							.modifier(ImageModifier())

						Text("Feminino")
							.modifier(TextModifier())
					}
				}
			}
		}
		.listRowSeparator(.hidden)
	}
}

struct ExtractedView_TRATAMENTOCAPILAR: View {
	var body: some View {
		Section(header: Text("Tratamento capilar").font(.title2).fontWeight(.bold)) {
			NavigationLink(destination: Tintura(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("tintura").resizable()
							.modifier(ImageModifier())

						Text("Tinturas")
							.modifier(TextModifier())
					}
				}
			}

			NavigationLink(destination: Hidratacao(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("hidratacao").resizable()
							.modifier(ImageModifier())

						Text("Hidratação")
							.modifier(TextModifier())
					}
				}
			}

			NavigationLink(destination: Penteados(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("penteados").resizable()
							.modifier(ImageModifier())

						Text("Penteados")
							.modifier(TextModifier())
					}
				}
			}
		}
		.listRowSeparator(.hidden)
	}
}

struct ExtractedView_UNHAS: View {
	var body: some View {
		Section(header: Text("Cuidados das unhas").font(.title2).fontWeight(.bold)) {
			NavigationLink(destination: Manicure(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("manicurePedicure").resizable()
							.modifier(ImageModifier())

						Text("Manicure e Pedicure")
							.modifier(TextModifier())
					}
				}
			}

			NavigationLink(destination: Podologia(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("podologia").resizable()
							.modifier(ImageModifier())

						Text("Podologia")
							.modifier(TextModifier())
					}
				}
			}
		}
		.listRowSeparator(.hidden)
	}
}

struct ExtractedView_PELE: View {
	var body: some View {
		Section(header: Text("Cuidados da pele").font(.title2).fontWeight(.bold)) {

			NavigationLink(destination: Maquiagem(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("maquiagem").resizable()
							.modifier(ImageModifier())

						Text("Maquiagem")
							.modifier(TextModifier())
					}
				}
			}

			NavigationLink(destination: LimpezaPele(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("limpezaPele").resizable()
							.modifier(ImageModifier())

						Text("Limpeza de pele")
							.modifier(TextModifier())
							.offset(CGSize(width: 0.0, height: 5.0)) // Reparado distancia do texto na parte de baixo da imagem
					}
				}
			}

			NavigationLink(destination: Peeling(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("peeling").resizable()
							.modifier(ImageModifier())

						Text("Peeling")
							.modifier(TextModifier())
					}
				}
			}
		}
		.listRowSeparator(.hidden)
	}
}

struct ExtractedView_DEPIL: View {
	var body: some View {
		Section(header: Text("Depilação").font(.title2).fontWeight(.bold)) {

			NavigationLink(destination: Depilacao(title: "Escolha o local")) {
				VStack {
					ZStack {
						Image("depilacao").resizable()
							.modifier(ImageModifier())

						Text("Buço e corporal")
							.modifier(TextModifier())
					}
				}
			}
		}
		.listRowSeparator(.hidden)
	}
}
