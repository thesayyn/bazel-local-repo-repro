
cd ./main

bazel build --experimental_repository_disable_download //:it $@
