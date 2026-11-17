test_that(".check_directory_content works", {
    expect_error(.check_directory_content(tempdir(), "my_file"), "not found")
    file.create(file.path(tempdir(), "my_file"))
    expect_no_error(.check_directory_content(tempdir(), "my_file"))
    unlink(file.path(tempdir(), "my_file"))
})

test_that(".check_overwriting works", {
    expect_error(.check_overwriting(tempdir()), "contains already")
    expect_no_error(.check_overwriting(file.path(tempdir(), "a")))
})

test_that(".is_alabaster_matrix_installed works", {
    expect_true(.is_alabaster_matrix_installed())
})

test_that(".is_spectra_stash_installed works", {
    expect_true(.is_spectra_stash_installed())
})

test_that(".is_alabaster_se_installed works", {
    expect_true(.is_alabaster_se_installed())
})

test_that(".is_ms_backend_metabo_lights_installed works", {
    expect_true(.is_ms_backend_metabo_lights_installed())
})

test_that(".match_metadata_spectra works", {
    files_mtd <- c("sample_A.mzML", "sample_B.mzML", "sample_C.mzML")

    ## All spectra files match: indices follow the order of files_spectra
    res <- .match_metadata_spectra(files_mtd, c("sample_C", "sample_A"))
    expect_equal(res, c("sample_C" = 3L, "sample_A" = 1L))

    ## At least one spectra file without a match returns NULL
    expect_null(.match_metadata_spectra(files_mtd, c("sample_A", "sample_Z")))
    expect_null(.match_metadata_spectra(files_mtd, c("sample_Z")))
})
