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
    ),
    Movie(
        id: 7,
        title: "Harry Potter e a Pedra Filosofal",
        image: "pedra_filosofal",
        synopsis: "Harry descobre aos 11 anos que é um bruxo e parte para Hogwarts, onde faz amigos e enfrenta Voldemort pela primeira vez.",
        rating: 7.6,
        releaseDate: "23/11/2001"
    ),
    Movie(
        id: 8,
        title: "Harry Potter e a Câmara Secreta",
        image: "camara_secreta",
        synopsis: "Durante seu segundo ano em Hogwarts, Harry descobre uma câmara misteriosa que guarda um segredo mortal do passado.",
        rating: 7.4,
        releaseDate: "22/11/2002"
    ),
    Movie(
        id: 9,
        title: "Harry Potter e o Prisioneiro de Azkaban",
        image: "prisioneiro_de_azkaban",
        synopsis: "Harry descobre segredos sobre seu passado e enfrenta perigos ao saber que Sirius Black, um perigoso prisioneiro, está à solta.",
        rating: 7.9,
        releaseDate: "04/06/2004"
    ),
    Movie(
        id: 10,
        title: "Harry Potter e o Cálice de Fogo",
        image: "calice_de_fogo",
        synopsis: "Harry é misteriosamente inscrito no Torneio Tribruxo e precisa enfrentar desafios mortais, além do retorno de Voldemort.",
        rating: 7.7,
        releaseDate: "25/11/2005"
    ),
    Movie(
        id: 11,
        title: "Harry Potter e a Ordem da Fênix",
        image: "ordem_da_fenix",
        synopsis: "Harry enfrenta o Ministério da Magia enquanto forma a Armada de Dumbledore para lutar contra a ameaça crescente de Voldemort.",
        rating: 7.5,
        releaseDate: "11/07/2007"
    ),
    Movie(
        id: 12,
        title: "Harry Potter e o Enigma do Príncipe",
        image: "enigma_do_principe",
        synopsis: "Enquanto Hogwarts se torna cada vez mais perigosa, Harry descobre pistas importantes sobre o passado de Voldemort.",
        rating: 7.6,
        releaseDate: "15/07/2009"
    ),
    Movie(
        id: 13,
        title: "Harry Potter e as Relíquias da Morte – Parte 1",
        image: "reliquias_da_morte_1",
        synopsis: "Harry, Rony e Hermione saem em busca das Horcruxes, tentando destruir o poder de Voldemort antes da batalha final.",
        rating: 7.7,
        releaseDate: "19/11/2010"
    ),
    Movie(
        id: 14,
        title: "Harry Potter e as Relíquias da Morte – Parte 2",
        image: "reliquias_da_morte_2",
        synopsis: "A batalha final entre Harry e Voldemort acontece em Hogwarts, encerrando a saga com coragem, sacrifício e esperança.",
        rating: 8.1,
        releaseDate: "15/07/2011"
    ),
    Movie(
        id: 15,
        title: "Piratas do Caribe: A Maldição do Pérola Negra",
        image: "perola_negra",
        synopsis: "O capitão Jack Sparrow e o ferreiro Will Turner partem para resgatar Elizabeth Swann, capturada por piratas amaldiçoados que se transformam em mortos-vivos à luz do luar.",
        rating: 8.0,
        releaseDate: "08/08/2003"
    ),
    Movie(
        id: 16,
        title: "Piratas do Caribe: O Baú da Morte",
        image: "bau_da_morte",
        synopsis: "Jack Sparrow descobre que tem uma dívida de sangue com Davy Jones. Agora ele precisa encontrar o lendário baú que contém o coração de Jones para escapar da condenação eterna.",
        rating: 7.3,
        releaseDate: "07/07/2006"
    ),
    Movie(
        id: 17,
        title: "Piratas do Caribe: No Fim do Mundo",
        image: "fim_do_mundo",
        synopsis: "Com Jack preso no Baú de Davy Jones, Will, Elizabeth e o Capitão Barbossa viajam até os confins do mundo para resgatá-lo e preparar-se para a batalha final contra a Companhia das Índias.",
        rating: 7.1,
        releaseDate: "25/05/2007"
    ),
    Movie(
        id: 18,
        title: "Piratas do Caribe: Navegando em Águas Misteriosas",
        image: "aguas_misteriosas",
        synopsis: "Jack Sparrow reencontra uma antiga paixão enquanto busca a Fonte da Juventude, enfrentando o lendário Barba Negra e sereias traiçoeiras.",
        rating: 6.6,
        releaseDate: "20/05/2011"
    ),
    Movie(
        id: 19,
        title: "Piratas do Caribe: A Vingança de Salazar",
        image: "vinganca_de_salazar",
        synopsis: "Assombrado por fantasmas do passado, Jack tenta sobreviver enquanto o capitão Salazar, recém-liberto do Triângulo do Diabo, busca vingança contra todos os piratas do mar.",
        rating: 6.5,
        releaseDate: "25/05/2017"
    ),
]
