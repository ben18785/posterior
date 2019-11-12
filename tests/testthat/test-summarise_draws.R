test_that("summarise_draws works correctly", {
  x <- as_draws_df(example_draws())
  sum_x <- summarise_draws(x, probs = c(0.1, 0.9))
  expect_true(all(default_convergence_measures() %in% names(sum_x)))
  expect_true(all(c("q10", "q90") %in% names(sum_x)))
  expect_equal(sum_x$variable, variables(x))
  expect_equal(mean(x$mu), sum_x$mean[sum_x$variable == "mu"])

  sum_x <- summarize_draws(x, measures = "quantile", probs = 0.25)
  expect_true("q25" %in% names(sum_x))

  mcses <- summarise_draws(x, default_mcse_measures())
  expect_true(all(c("mcse_q5", "mcse_q95") %in% names(mcses)))
})

test_that("aliases of summarise_draws work", {
  x <- as_draws_array(example_draws())
  sum_x <- summarise_draws(x)
  sum_x2 <- summarize_draws(x)
  expect_equal(sum_x, sum_x2)
  sum_x3 <- summary(x)
  expect_equal(sum_x, sum_x3)
})

test_that("summarise_draws errors if name 'variable' is used", {
  x <- example_draws()
  variable <- function(x) mean(x)
  expect_error(
    summarise_draws(x, measures = "variable"),
    "Name 'variable' is reserved in 'summarise_draws'"
  )
})