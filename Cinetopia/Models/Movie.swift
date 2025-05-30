//
//  Movie.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 30/05/25.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rating: Double
    let releaseDate: String
}

let movies: [Movie] = [
    Movie(
        id: 1,
        title: "O Senhor dos Anéis: A Sociedade do Anel",
        image: "sociedade_do_anel",
        synopsis: "Em tempos remotos, Sauron tentou dominar toda a Terra-Média com o poder de um anel. Após o anel ser perdido, ele é encontrado por Frodo, um hobbit que parte em uma jornada para destruí-lo no Monte da Perdição.",
        rating: 8.9,
        releaseDate: "10/12/2001"
    ),
    Movie(
        id: 2,
        title: "O Senhor dos Anéis: As Duas Torres",
        image: "duas_torres",
        synopsis: "Com a Sociedade do Anel desfeita, Frodo e Sam continuam sua jornada até Mordor guiados por Gollum, enquanto Aragorn, Legolas e Gimli enfrentam batalhas para proteger o reino de Rohan do avanço de Saruman.",
        rating: 8.8,
        releaseDate: "18/12/2002"
    ),
    Movie(
        id: 3,
        title: "O Senhor dos Anéis: O Retorno do Rei",
        image: "retorno_do_rei",
        synopsis: "Enquanto Frodo e Sam se aproximam do Monte da Perdição, Aragorn deve aceitar seu destino como o legítimo rei de Gondor para liderar os povos livres da Terra-Média contra as forças de Sauron.",
        rating: 9.0,
        releaseDate: "17/12/2003"
    ),
    Movie(
        id: 4,
        title: "O Hobbit: Uma Jornada Inesperada",
        image: "jornada_inesperada",
        synopsis: "Bilbo Bolseiro é um hobbit pacato que é recrutado por Gandalf e um grupo de anões liderados por Thorin Escudo-de-Carvalho para recuperar o reino perdido de Erebor, guardado pelo dragão Smaug.",
        rating: 7.8,
        releaseDate: "14/12/2012"
    ),
    Movie(
        id: 5,
        title: "O Hobbit: A Desolação de Smaug",
        image: "desolacao_de_smaug",
        synopsis: "A jornada de Bilbo e os anões continua enquanto enfrentam aranhas gigantes, elfos e o temível dragão Smaug, na tentativa de recuperar a Montanha Solitária e o reino de Erebor.",
        rating: 7.8,
        releaseDate: "13/12/2013"
    ),
    Movie(
        id: 6,
        title: "O Hobbit: A Batalha dos Cinco Exércitos",
        image: "batalha_dos_cinco_exercitos",
        synopsis: "Após a morte de Smaug, várias forças convergem para a Montanha Solitária, levando a uma batalha épica entre cinco exércitos pelo controle de Erebor e suas riquezas.",
        rating: 7.4,
        releaseDate: "11/12/2014"
    )
]
