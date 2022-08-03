## The purpose of this script is to check if Naive Bayes is a good approach for
## the problem. That is, if it achieves at least 80% accuracy.

library(e1071)

cars = read.csv("car.data", sep = ",")

carsSample = sample(2, 1728, replace = T, prob = c(0.7, 0.3))
carsTrain = cars[carsSample == 1,]
carsTest = cars[carsSample == 2,]

NBmodel = naiveBayes(class ~ ., carsTrain)
prediction = predict(NBmodel, carsTest)

confusionMatrix = table(carsTest$class, prediction)

accuracy = ((confusionMatrix[1] + confusionMatrix[6] + confusionMatrix[11] + confusionMatrix[16]) / sum(confusionMatrix))

show(accuracy)