

# Create the dataframe
df <- data.frame(
  cyl = c(4, 4, 4, 6, 6, 8, 8),
  vs  = c(0, 1, 1, 0, 1, 0, 0),
  am  = c(1, 0, 1, 1, 0, 0, 1),
  avg = c(26.0, 22.9, 28.4, 20.6, 19.1, 15.1, 15.4)
) |> as.data.frame()

# View the dataframe
print(df)

expected <- mean_by(mtcars, rlang::exprs(cyl, vs, am), mpg) |> mutate(avg=round(avg,1)) |>
  as.data.frame()
expected

test_that("multiplication works", {
  expect_equal(df, expected)
  expect_s3_class(expected, 'data.frame')
  expect_equal(dim(expected),c(7,4))
  expect_named(expected, c('cyl','vs','am','avg'))
})

