require "csv"

MovieGenre.delete_all
Genre.delete_all
Movie.delete_all
ProductionCompany.delete_all

filename = Rails.root.join("db/top_movies.csv")
puts "Loading data from this file: #{filename}"

csv_data = File.read(filename)

movies = CSV.parse(csv_data, headers: true, encoding: "utf-8")

movies.each do |movie|
  production_company = ProductionCompany.find_or_create_by(name: movie["production_company"])

  if production_company&.valid?
    # Create the movie
    new_movie = production_company.movies.create(
      title: movie["original_title"],
      year: movie["year"],
      duration: movie["duration"],
      description: movie["description"],
      average_vote: movie["avg_vote"]
    )
    if !new_movie&.valid?
      puts "Unable to create movie: #{movie["original_title"]}"
      next
    end

    genre_names = movie["genre"].split(", ")
    genre_names.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)
      MovieGenre.create(movie: new_movie, genre: genre)
    end
  else
    puts "This Production Company has errors: #{movie["production_company"]}"
  end
end

puts "There are #{ProductionCompany.count} Production Companies"
puts "There are #{Movie.count} Movies"
puts "There are #{Genre.count} Genres"
puts "There are #{MovieGenre.count} Movies Genres"
