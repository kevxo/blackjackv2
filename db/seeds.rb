# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(2..9).each do |index|
    suites = ["clubs", "diamonds", "hearts", "spades"]

    suites.each do |suit|
        Card.create!(number: index, suit: suit, img: "#{index}_of_#{suit}")
    end
end

4.times do
    faces = ["10","jack", "king", "queen"]
    suites = ["clubs", "diamonds", "hearts", "spades"]

    suites.each_with_index do |suit, index|
        Card.create!(number: 10, suit: suit, img: "#{faces[index]}_of_#{suites[index]}")
    end
end

4.times do |index|
    suites = ["clubs", "diamonds", "hearts", "spades"]

    Card.create!(number: 11, suit: "ace", img: "ace_of_#{suites[index]}")
end