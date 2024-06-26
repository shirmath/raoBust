test_that("replicates work", {

  set.seed(1)
  data(cars)
  cars2 <- cars
  cars2$wts <- log(rnorm(nrow(cars), 20))
  cars2$batch1 <- rep(LETTERS[1:5], each = 10)
  cars2$batch2 <- rep(LETTERS[6:10], 10)
  cars2$batch3 <- rep(1:5, each = 10)

  ### fails in test unless `cars` is loaded?
  gee_test(formula = dist ~ speed,
           data = cars2,
           id = batch3,
           family=poisson(link="log"),
           offset = wts)

  ### Results should be consistent regardless of exact form of `id`
  ### Should be robust to ordering

  expect_identical(
    gee_test(formula = dist ~ speed,
             data = cars2,
             id = batch3,
             family=poisson(link="log"),
             offset = wts),
    gee_test(formula = dist ~ speed,
             data = cars2,
             id = batch1,
             family=poisson(link="log"),
             offset = wts)
  )

  # devtools::load_all()
  expect_identical(
    gee_test(formula = dist ~ speed,
             data = cars2,
             id = batch2,
             family=poisson(link="log"),
             offset = wts)
    ,
    gee_test(formula = dist ~ speed,
             data = cars2[cars2$batch2 %>% order, ],
             id = batch2,
             family=poisson(link="log"),
             offset = wts)
  )

  expect_true({
    is.data.frame(gee_test(formula = dist ~ speed,
                           data = cars2,
                           id = batch1,
                           family=poisson(link="log"),
                           offset = wts))
  })

  #### check gives warning if weights provided
  expect_warning(
    gee_test(formula = dist ~ speed,
             data = cars2,
             id = batch3,
             family=poisson(link="log"),
             offset = wts,
             weights = wts)
  )

  #### check correlation is estimated to be positive
  set.seed(2)
  cars3 <- rbind(cars, cars, cars)
  cars3$dist <- cars3$dist + sample(-2:2, replace=TRUE, size = length(cars3$dist))
  cars3$batch <- 1:length(cars$dist)
  expect_gt(gee_test(formula = dist ~ speed,
                       data = cars3,
                       id = batch,
                       family=poisson(link="log"))[3, "Estimate"], 0.9)


  #### check I've implemented score tests with clusters
  expect_false(
    any(is.na(gee_test(formula = dist ~ speed,
                       data = cars2,
                       id = batch3,
                       family=poisson(link="log"),
                       offset = wts)[["Robust Score p"]][1:2]))
  )
})

test_that("geeasy and geepack give similar results", {
  set.seed(1)
  data(cars)
  cars2 <- cars
  cars2$wts <- log(rnorm(nrow(cars), 20))
  cars2$batch1 <- rep(LETTERS[1:5], each = 10)
  cars2$batch2 <- rep(LETTERS[6:10], 10)
  cars2$batch3 <- rep(1:5, each = 10)
  
  geeasy_test <- gee_test(formula = dist ~ speed,
                          data = cars2,
                          id = batch3,
                          family=poisson(link="log"),
                          offset = wts)
  
  geepack_test <- gee_test(use_geeasy = FALSE,
                           formula = dist ~ speed,
                           data = cars2,
                           id = batch3,
                           family=poisson(link="log"),
                           offset = wts)
  expect_true((geeasy_test$Estimate[1] - geepack_test$Estimate[1])/geeasy_test$Estimate[1] < 0.01)
})

