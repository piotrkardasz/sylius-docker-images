package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//container:import.bzl", "container_import")
load("//:php-arch.bzl", "ARCHITECTURES")
load("//:php-version.bzl", "PHP_VERSION")

[
    container_test(
        name = "php" + PHP_VERSION + "_" + arch + "_test",
        size = "medium",
        configs = ["testdata/php" + PHP_VERSION + "_" + arch + ".yaml"],
        image = "@image" + arch + "//image",
    )
    for arch in ARCHITECTURES
]
