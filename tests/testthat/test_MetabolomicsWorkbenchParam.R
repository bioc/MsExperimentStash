test_that("MwbParam works", {
    expect_error(MwbParam(mwbId = ")Qn"), "must start")
    param <- MwbParam(mwbId = "ST002115")
    expect_is(param, "MwbParam")

    expect_error(MwbParam(), "required")
})
