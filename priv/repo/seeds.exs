# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BandManager.Repo.insert!(%BandManager.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BandManager.Repo
alias BandManager.Artists.{Band, Album, Song}

defmodule Extra do
  import Ecto.Query

  def first_or_create(schema, data) do
    q = from i in schema, where: i.name == ^data.name
    Repo.one(q) || Repo.insert!(data)
  end
end

##
# Billy Talent

bt = Extra.first_or_create(Band, %Band{name: "Billy Talent", genre: "Punk Rock", description: "Billy Talent is a Canadian punk rock band from Mississauga, Ontario. They formed in 1993 with Benjamin Kowalewicz as the lead vocalist, Ian D'Sa on guitar, bassist Jon Gallant and drummer Aaron Solowoniuk. There have been no lineup changes, although Aaron is currently taking a hiatus from the band due to an MS relapse, Jordan Hastings from Alexisonfire, Cunter and Say Yes is currently filling in for him. In the 24 years since their inception, Billy Talent sold well over one million albums in Canada alone and nearly 3 million albums internationally. (Source: Wikipedia)"})

ah = Extra.first_or_create(Album, %Album{name: "Afraid of Heights", year: 2016, band: bt})
Extra.first_or_create(Song, %Song{name: "Big Red Gun", album: ah})
Extra.first_or_create(Song, %Song{name: "Afraid of Heights", album: ah})
Extra.first_or_create(Song, %Song{name: "Ghost Ship of Cannibal Rats", album: ah})
Extra.first_or_create(Song, %Song{name: "Louder than the DJ", album: ah})
Extra.first_or_create(Song, %Song{name: "The Crutch", album: ah})
Extra.first_or_create(Song, %Song{name: "Rabbit Down the Hole", album: ah})

ds = Extra.first_or_create(Album, %Album{name: "Dead Silence", year: 2012, band: bt})
Extra.first_or_create(Song, %Song{name: "Lonely Road to Absolution", album: ds})
Extra.first_or_create(Song, %Song{name: "Viking Death March", album: ds})
Extra.first_or_create(Song, %Song{name: "Surprise Surprise", album: ds})
Extra.first_or_create(Song, %Song{name: "Runnin' Across the Tracks", album: ds})
Extra.first_or_create(Song, %Song{name: "Love Was Still Around", album: ds})
Extra.first_or_create(Song, %Song{name: "Stand Up and Run", album: ds})

##
# Linkin Park

lp = Extra.first_or_create(Band, %Band{name: "Linkin Park", genre: "Nu Metal"})

ml = Extra.first_or_create(Album, %Album{name: "One More Light", band: lp})
Extra.first_or_create(Song, %Song{name: "Nobody Can Save Me", album: ml})
Extra.first_or_create(Song, %Song{name: "Good Goodbye", album: ml})
Extra.first_or_create(Song, %Song{name: "Talking to Myself", album: ml})
Extra.first_or_create(Song, %Song{name: "Battle Symphony", album: ml})
Extra.first_or_create(Song, %Song{name: "Invisible", album: ml})
Extra.first_or_create(Song, %Song{name: "Heavy", album: ml})
Extra.first_or_create(Song, %Song{name: "Sorry for Now", album: ml})
Extra.first_or_create(Song, %Song{name: "Halfway Right", album: ml})
Extra.first_or_create(Song, %Song{name: "One More Light", album: ml})
Extra.first_or_create(Song, %Song{name: "Sharp Edges", album: ml})


_md = Extra.first_or_create(Band, %Band{name: "Madonna", genre: "Pop", description: "Madonna Louise Ciccone (/tʃɪˈkoʊni/; born August 16, 1958) is an American singer, songwriter, actress, and businesswoman. A leading presence during the emergence of MTV in the 1980s, Madonna is known for pushing the boundaries of lyrical content in mainstream popular music, as well as visual imagery in music videos and live performances. She has also frequently reinvented both her music and image while maintaining autonomy within the recording industry. Her diverse musical productions have been acclaimed by music critics and often generated controversy in media and public. Referred to as the \"Queen of Pop\", Madonna is widely cited as an influence by other artists. (Source: Wikipedia)"})

##
# Nightwish

nw = Extra.first_or_create(Band, %Band{name: "Nightwish", genre: "Symphonic Metal", description: "Nightwish is a symphonic metal band from Kitee, Finland. The band was formed in 1996 by lead songwriter and keyboardist Tuomas Holopainen, guitarist Emppu Vuorinen, and lead singer Tarja Turunen. The band soon picked up drummer Jukka Nevalainen, and then bassist Sami Vänskä after the release of their debut album, Angels Fall First (1997). In 2002, Vänskä was replaced by Marco Hietala, who also took over the male vocalist role previously filled by Holopainen or guest singers. (Source: Wikipedia)"})

wm = Extra.first_or_create(Album, %Album{name: "Wishmaster", year: 2000, band: nw})
Extra.first_or_create(Song, %Song{name: "The Kinslayer", album: wm})
Extra.first_or_create(Song, %Song{name: "Wanderlust", album: wm})
Extra.first_or_create(Song, %Song{name: "Wishmaster", album: wm})
Extra.first_or_create(Song, %Song{name: "Crownless", album: wm})
Extra.first_or_create(Song, %Song{name: "Dead Boy's Poem", album: wm})

on = Extra.first_or_create(Album, %Album{name: "Once", year: 2004, band: nw})
Extra.first_or_create(Song, %Song{name: "Dark Chest of Wonders", album: on})
Extra.first_or_create(Song, %Song{name: "Wish I Had an Angel", album: on})
Extra.first_or_create(Song, %Song{name: "Nemo", album: on})
