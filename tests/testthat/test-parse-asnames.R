context("parse_asnames")

test_that("parse_asnames parses asnames.txt lines", {
  tf <- tempfile(fileext = ".txt")
  writeLines(c(
    "AS13335 CLOUDFLARENET - Cloudflare, Inc., US",
    "AS15169 GOOGLE - Google LLC, US"
  ), tf)

  res <- parse_asnames(tf)

  expect_equal(colnames(res), c("asn", "handle", "asinfo", "iso2c"))
  expect_equal(res$asn, c("13335", "15169"))
  expect_equal(res$handle, c("CLOUDFLARENET", "GOOGLE"))
  expect_equal(res$asinfo, c("Cloudflare, Inc.", "Google LLC"))
  expect_equal(res$iso2c, c("US", "US"))
})
