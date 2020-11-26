

#create random items
20.times do
  Item.create!(
  title: [Faker::Food.dish, Faker::Dessert.topping, Faker::Music::RockBand.name, Faker::ProgrammingLanguage.name, Faker::DcComics.hero, Faker::DcComics.heroine].sample,
  description: "Je suis un chaton tout mignon ! Je vends des photos de moi pour me payer des études de "+Faker::Job.title+
  " (mes proprios ont pas la thune c'est chaud). J'aime bien "+["recevoir plein de câlins et de gratouilles", "faire mes griffes sur les meubles (surtout les chers)", "dormir dans le linge propre et mettre des poils partout", "manger trop d'herbe à chat et vomir sur le lit", "miauler en pleine nuit, comme ça pour le fun."].sample,
  price: Faker::Number.between(from: 1, to: 1000),
  image_url: ["http://lorempixel.com/640/480/cats", "http://placekitten.com/640/480", "http://placekitten.com/480/640", "https://loremflickr.com/480/640", "http://lorempixel.com/640/480/cats", "http://placekitten.com/640/480", "http://placekitten.com/480/640", "https://loremflickr.com/480/640"].sample
  )
end

puts "*" * 20
puts "ITEMS"
puts tp Item.all


