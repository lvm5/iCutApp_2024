//
//  MascEstabelecimentos.swift
//  iCutApp
//
//  Created by Leandro Morais on 18/11/23.
//

import SwiftUI
import SwiftData


struct MascEstabelecimentos: View {

    struct Horario: Identifiable {
        let id = UUID()
        var hora: String
        var reservado: Bool = false
        var nomeReservador: String? = nil
    }

    @State var horarios: [Horario] = [
        Horario(hora: "09:00"),
        Horario(hora: "10:00"),
        Horario(hora: "11:00"),
        // Adicione mais horários conforme necessário
    ]

    @State var nomeReservador: String = ""
    @State var mostrarAlerta = false

    var title: String

    var body: some View {


        VStack {
            Spacer()
            Text(title)
                .bold()
                .font(.title3)

            List(horarios.indices, id: \.self) { index in
                let horario = horarios[index]

                HStack {
                    Text(horario.hora)
                    Spacer()
                    Button(action: {
                        if !horario.reservado {
                            // Exibe o Alert para inserir o nome do reservador
                            nomeReservador = ""
                            mostrarAlerta = true
                            horarios[index].reservado = true // Atualiza o horário para reservado
                        }
                    }) {
                        if horario.reservado {
                            Text("Reservado \(horario.nomeReservador ?? "")")
                                .foregroundColor(.gray)
                        } else {
                            Text("Reservar")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .alert(isPresented: $mostrarAlerta) {
                    Alert(
                        title: Text("Deseja mesmo reservar esse horário?"),
                        //message: Text("Quer reservar o horário \($horario.hora) ? "),
                        primaryButton: .default(Text("Reservar"), action: {
                            // Atualiza o nome do reservador para o horário selecionado
                            if let index = horarios.firstIndex(where: { $0.reservado == true }) {
                                horarios[index].nomeReservador = nomeReservador
                            }
                        }),
                        secondaryButton: .cancel()
                    )
                }
            }
        }
    }
}


#Preview {
    MascEstabelecimentos(title: "Escolha um horário")
}
