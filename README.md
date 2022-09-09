# Car Quality Estimation

Web app to estimate car quality based on the car properties informed by the user.

---

## Usage

Install the Shiny R package on your machine by running the following command on your R console:

```
install.packages("shiny")
```

Once finished installing, clone or download this repository and open the "app.R" file with Rstudio. Rstudio will automatically detect that it is a Shiny app file and a "Run App" button will appear on the top of the editor screen. Click the button to run the app.

Alternatively, with the repository cloned, open your R console and set the working directory to the absolute path where the repository was cloned:

```
setwd(path_to_cloned_repository)
```

Then, load the Shiny library and run the file "app.R":

```
library(shiny)
runApp("app/app.R")
```

The app will start on a new browser tab in your default browser.

## App Features

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

## User Interface Sample

![ui_car-quality-estimation](https://user-images.githubusercontent.com/33037020/184465749-b85da4fe-bd71-4465-acd0-73c587efec67.JPG)

*[Shiny] is a framework that allows users to develop web apps using R and embedded web languages, such as CSS and HTML. Shiny apps focus on objectiveness and simplicity: only one or two R scripts have all the code for the app.*

*This app development started with knowledge and tools discussed during the course "Data Science Bootcamp" by Fernando Amaral. The app has been upgraded and personalized, adding new functionalities.*

[//]: #

[Shiny]: <https://www.shinyapps.io>
