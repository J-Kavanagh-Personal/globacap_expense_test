# Globacap Expenses Technical Test

## Design

My design for this technical task was to be lightweight and be as extendable as possible. What I assumed for the design:

- Users could have multiple expenses.
- Users must have an identifier i.e a name.
- Expenses must be saved with an amount.
- The summary must collate all expenses for one user and can be zero if no expenses.
- The currency was pounds.
- No auth required between Users means no login however it could be added later and so the User needs to be lean to allow login and Oauth for API later.
- This is not a single page application but could be made to be one later.
- User and Expenses are relational

My design includes:

- Rails to handle backend logic and handling requests.
- Active Record to handle sql and database communications and queries.
- React to build components for views.
- Postgres as the database.

Things I would've added if I had time:

- Making sure that the creation of expenses is done transactional in jobs rather than direct from the request.
- Improve test coverage (simplecov, capybara, BDD)
- Consider making the app one single page application.
- Create summary component (graphs over time might be cool)
- Admin section for users with access privileges/roles.
- Add styling (anything really)
- Add more security, error handling and guarding
- Flesh out the postman collection add in Oauth token for accessing endpoints

## Instructions for installation

- Install ruby `3.3.0`
- Install node `20.11.1`
- Install yarn `1.22.21`
- Install gems `bundle install`
- Install modules `yarn install`
- Setup and install postgres `16`
- Add database credentials in .env
- - DATABASE_PASSWORD
- - DATABASE_USERNAME
- Run the database creation, migrations and seeds to get a fully working database for the application.
- Run rails locally via `rails s`
- Build assets for react with `yarn build`
- Access the application at `http://127.0.0.1:3000/`
- `rspec` to run tests

## Instructions for the postman collection

- Import the collection `globacap_expenses_test.postman_collection.json` into postman
- Check that the server is running
- Check that the request is point at the correct domain i.e `http://127.0.0.1:3000/`