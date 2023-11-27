pushd main
/Users/thesayyn/Documents/bazel/bazel-bin/src/bazel build --repository_disable_download //:it
bazel build --experimental_repository_disable_download //:it
popd