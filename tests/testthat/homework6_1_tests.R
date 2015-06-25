library("testthat")

# Test for mode function
expect_error(IPIPANRcourseHomework::mode(c("a", "b")))
expect_error(IPIPANRcourseHomework::mode2(c("a", "b")))

expect_equal(IPIPANRcourseHomework::mode(c(7)), 7)
expect_equal(IPIPANRcourseHomework::mode2(c(7)), 7)
expect_equal(IPIPANRcourseHomework::mode(c(-2)), -2)
expect_equal(IPIPANRcourseHomework::mode2(c(-2)), -2)
expect_equal(IPIPANRcourseHomework::mode(rep(7,19)), 7)
expect_equal(IPIPANRcourseHomework::mode2(rep(7,19)), 7)
expect_equal(IPIPANRcourseHomework::mode(c(7,2)), 2)
expect_equal(IPIPANRcourseHomework::mode2(c(7,2)), 2)
expect_equal(IPIPANRcourseHomework::mode(c(8,7,9)), 7)
expect_equal(IPIPANRcourseHomework::mode2(c(8,7,9)), 7)
expect_equal(IPIPANRcourseHomework::mode(c(2,3,3)), 3)
expect_equal(IPIPANRcourseHomework::mode2(c(2,3,3)), 3)
expect_equal(IPIPANRcourseHomework::mode(c(2,2,3)), 2)
expect_equal(IPIPANRcourseHomework::mode2(c(2,2,3)), 2)
expect_equal(IPIPANRcourseHomework::mode(c(4,3,3)), 3)
expect_equal(IPIPANRcourseHomework::mode2(c(4,3,3)), 3)
expect_equal(IPIPANRcourseHomework::mode(c(4,4,3)), 4)
expect_equal(IPIPANRcourseHomework::mode2(c(4,4,3)), 4)
expect_equal(IPIPANRcourseHomework::mode(c(4,5,4,5,6,5,6)), 5)
expect_equal(IPIPANRcourseHomework::mode2(c(4,5,4,5,6,5,6)), 5)
expect_equal(IPIPANRcourseHomework::mode(c(4,6,4,5,6,5,6)), 6)
expect_equal(IPIPANRcourseHomework::mode2(c(4,6,4,5,6,5,6)), 6)
expect_equal(IPIPANRcourseHomework::mode(c(4,5,4,5,6,4,6)), 4)
expect_equal(IPIPANRcourseHomework::mode2(c(4,5,4,5,6,4,6)), 4)
expect_equal(IPIPANRcourseHomework::mode(c(-4,-5,4,5,6,-4,6)), -4)
expect_equal(IPIPANRcourseHomework::mode2(c(-4,-5,4,5,6,-4,6)), -4)
expect_equal(IPIPANRcourseHomework::mode(c(1, 2, 2, 2, 3, 3, 1, 3)), 2)
expect_equal(IPIPANRcourseHomework::mode2(c(1, 2, 2, 2, 3, 3, 1, 3)), 2)




