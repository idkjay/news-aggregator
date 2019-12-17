It's important to stay connected with what's going on in the world (even if that means spending hours scouring reddit rather than accomplishing anything productive). Let's build a news aggregator application so we can share some pointless articles and help others waste time effectively.

### Learning Objectives

* Build an application that receives user input via HTTP POST requests.
* Persist user data on the server so it can be used to generate pages dynamically.
* Construct API endpoints that will return JSON.
* Implement the use of the Fetch API in JavaScript in order to crate a more streamlined user experience.

#### Important Tips:

This lesson will have you working extensively with CSVs. For resources on saving data to a CSV, we strongly suggest you check out these docs on [Ruby's CSV class](https://docs.ruby-lang.org/en/2.1.0/CSV.html). Interacting with a CSV doc can be a challenge. Go slowly, and use `binding.pry` or `puts` to navigate how the CSV class methods work. You might try the `.foreach` method, the `.readlines` method, or the `.open` method to read or write to the CSV file. It might be helpful to think of the CSV file as something akin to an excel spreadsheet, or an array of arrays.

You may very well get stuck, just be sure to review [Troubleshooting and Asking Questions at Launch](https://learn.launchacademy.com/lessons/asking-questions-at-launch)
in order to ensure that you don't spin your wheels too long. Remember that one of the distinguishing characteristics of a professional software engineer is their ability to debug and effectively read their errors. Ruby error messages will often point you in the direction that you need to go!

### Instructions

Build a web application using Sinatra that displays a list of articles that users have submitted.

In order to build your Sinatra application, please review [How to Build a Sinatra App](https://learn.launchacademy.com/lessons/how-to-build-a-sinatra-app).

The application should satisfy the following core user stories:

```no-highlight
As a slacker
I want to be able to visit a page that shows me all the submitted articles
So that I can distract myself from the actual work I have to do
```

Acceptance Criteria:

* When I visit `/articles` I should be able to see all the articles that have been submitted.
* Each article should show the description, title, and URL.
* If I click on the URL it should take me to the relevant page inside of a new tab.  
**If you want to use an external link with sinatra, you have to start the link with either `http://` or `https://` or it will automatically assume that it is an internal link.**

```no-highlight
As a slacker
I want to be able to submit an incredibly interesting article
So that other slackers may benefit from my distraction
```

Acceptance Criteria:

* When I visit `/articles/new` it has a form to submit a new article.
* The form accepts an article title, URL, and description.
* When I successfully post an article, it should be saved to a CSV file.
* If I try to submit an empty form, I stay on my form page, and nothing is saved to my CSV file.

## Non-Core User Stories

_Only tackle these additional user stories if you have completed the Core User Stories._ You may choose any order in which to approach these stories, but the order in which they appear is suggested.

The optional JavaScript user stories require that you first
read our material regarding Fetch and Promises in JavaScript. Don't tackle these stories unless you have done so.

* [ES6 Fetch API](https://learn.launchacademy.com/lessons/es6-fetch-api)
* [Fetch API Practice](https://learn.launchacademy.com/lessons/fetch-api-practice)

#### JavaScript Optional User Stories

```no-highlight
As an errant slacker
I want to see a random article
So that I can spend less time choosing which article to read
```

Acceptance Criteria:

* When I visit `/random` it has a button with the text "Random Button".
* When the button is clicked, a fetch call should generate a request to an API endpoint on the Sinatra backend
* The API endpoint should return a random article as a response, and that article's information will need to append to the page.

Tips:
* You may wish to review past JavaScript assignments in order to recall how to manipulate the DOM and add event handlers.
* You'll need to create a folder titled `public` in the root of your application. That folder should also have a `js` folder in it e.g. `public/js`. This folder is where you should keep the JavaScript file that will run on your page e.g. `public/js/app.js`.
* In your JavaScript file, you'll want to add an event listener that will trigger your fetch request.
* Upon a successful fetch request, you will need to write JavaScript code that will append your article information to an element on the DOM
* In order to have that JavaScript run on your page, you will need to add a script tag to the bottom of the `random.erb` template that you create.

```html
<script src="/js/app.js"></script>
```

* Use your new CSV skills to retrieve a random article from your `articles.csv`. Ensure that you use the proper syntax for returning json data instead of HTML in your endpoint:

```ruby
get "/random_article.json" do
  content_type :json

  # Your ruby code that pulls an a random article from your CSV file.

  status 200
  books.to_json
end
```

#### Non-JavaScript Optional User Stories

For an extra **optional** challenge, implement the following additional non-js user stores:

```no-highlight
As a slacker
I want to view an individual articles show page
So that I can learn more about that article
```

Acceptance Criteria:

* When I visit `/articles/:id`, I should be brought to a page with the title, url and description of the article whose id I am viewing
* Note: This will require that you include an `id` attribute for each of your articles.
* For example, visiting `/articles/2` should bring me to a page with the article that has an `id` of `2`

```no-highlight
As an errant slacker
I want to receive an error message
When I submit an invalid article
```

Acceptance Criteria:

* If I do not specify a title, URL, and description, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* If I specify an invalid URL, I receive an error message, and the submission form is re-rendered with the details I have previously submitted. A URL is valid if it begins with `http`.
* If I specify a description that doesn't have 20 or more characters, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in any of the above cases.

```no-highlight
As a plagiarizing slacker
I want to receive an error message
When I submit an article that has already been submitted
```

Acceptance Criteria:

* If I specify a URL that has already been submitted, I receive an error message, and the submission form is re-rendered with the details I have previously submitted.
* The submitted article is not saved in the above case.
