context("CalculateMWAD.R")

test_that("CalculateMWAD returns a data.table object", {
  data <- data.table::data.table(col1 = seq(0.8, 1.2, 0.1), col2 = rnorm(5L, 1L, 0.1),
                                 ekspo = runif(5L))
  res <- CalculateMWAD(data, "col1")
  expect_is(res, "data.table")
})

test_that("CalculateMWAD returns a data.table with correct dimensions and names", {
  data <- data.table::data.table(col1 = seq(0.8, 1.2, 0.1), col2 = rnorm(5L, 1L, 0.1),
                                 ekspo = runif(5L))
  res <- CalculateMWAD(data, c("col1", "col2"))
  expect_named(res, c("col1", "col2"))
  expect_length(res, 2L)
})

test_that("CalculateMWAD correctly uses weights if supplied", {
  data <- data.table::data.table(col1 = seq(0.8, 1.2, 0.1), col2 = rnorm(5L, 1L, 0.1),
                                 ekspo = c(0L, 0L, 1L, 0L, 0L))
  res <- CalculateMWAD(data, "col1", "ekspo")
  expect_equal(res[["col1"]], 0.0)
})

test_that("CalculateMWAD calls helper MWAD with correct argumets", {
  data <- data.table::data.table(col1 = 5L, col2 = 6L, ekspo = 0.5)
  # Mocks
  MWADMock <- mockery::mock(10L, 20L)
  # Stubbing
  mockery::stub(CalculateMWAD, "MWAD", MWADMock)
  res <- CalculateMWAD(data, c("col1", "col2"), "ekspo")
  # Calls
  mockery::expect_called(MWADMock, 2L)
  # Args
  mockery::expect_args(MWADMock, 1L, 5L, 0.5)
  mockery::expect_args(MWADMock, 2L, 6L, 0.5)
})
