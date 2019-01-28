library(caret)
library(randomForest)

data(mtcars)


dataStructure <- capture.output(str(mtcars))

set.seed(42)

customTrainControl <- trainControl(method = "cv", number = 5)

carsRandomForestModelBuilder <- function() {
  
  return(
    train(
      mpg ~ ., 
      data = mtcars,
      method = "rf",
      trControl = customTrainControl
    )
  )
  
}

randomForestPredictor <- function(model, parameters) {
  
  prediction <- predict(
    model,
    newdata = parameters
  )
  
  return(prediction)
  
}