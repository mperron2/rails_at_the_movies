
## Routes
GET /                            => home#index      (Show the home page view)
GET /movies                      => movies#index    (Show all the movies)
GET /movies/:id                  => movies#show     (Show an individual movie)
GET /production_companies        => movies#index    (Show all the movies)
GET /production_companies/:id    => movies#show     (Show an individual Production Company)


## Controllers
HomeController                => index
MoviesController              => index,show
ProductionCompaniesController => index, show