# Car Quality Estimation

Web app to estimate car quality based on the car properties informed by the user.

### Features in This App
* The model is trained using a file given along with the app (in the data folder of this repository). Therefore, the user does not need to input any files in the app;
* The app user can select 6 different variables considering the car to evaluate:
    1. Price, between low, medium, high and very high;
    2. Maintenance level, between low, medium, high and very high;
    3. Number of doors, between 2, 3, 4 and more;
    4. Seating capacity, between 2, 4 and more;
    5. Luggage size, between small, medium and big;
    6. Safety, between low, medium and high.
* When the user clicks the "Estimate!" button, the car quality is estimated using Naive Bayes;
* Car quality is printed on the screen after the quick estimation.

*[Shiny] is a framework that allows users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>
