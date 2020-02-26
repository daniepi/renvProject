context("MWAD.R")

test_that("MWAD return numeric", {
  x <- 1L:3L
  res <- MWAD(x)
  expect_is(res, "numeric")
})

test_that("MWAD uses weights", {
  x <- 1L:3L
  w <- c(0L, 1L, 0L)
  res <- MWAD(x, w, target = 2L)
  expect_equal(res, 0L)
})
