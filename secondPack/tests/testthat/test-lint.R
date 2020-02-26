context("Lintr testing")
test_that("Code is linter error free", {
  lintr::expect_lint_free()
})
