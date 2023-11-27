# bazel-in-bazel bug bzlmod

This case succeeeds both inside and outside regardless

```sh
./test.sh --enable_bzlmod
./test.sh --noenable_bzlmod
```

However running exact test inside bazel with `--enable_bzlmod` fails

```sh
bazel test :test_enable_bzlmod
```

Whereas `--noenable_bzlmod` succeed

```sh
bazel test :test_noenable_bzlmod
```


## error

```log
Extracting Bazel installation...
Starting local Bazel server and connecting to it...
Loading: 
Loading: 
Loading: 
Loading: 
Loading: 0 packages loaded
Analyzing: target //:it (1 packages loaded, 0 targets configured)
INFO: Repository platforms instantiated at:
  callstack not available
Repository rule http_archive defined at:
  /private/var/tmp/_bazel_thesayyn/d699b2d85eb10b7585cbabe1226b83c4/sandbox/darwin-sandbox/75/execroot/__main__/_tmp/000223ba99b6c3a2203ec6e8547dd133/_bazel_thesayyn/046bc434811462594c61d09cb4a05a06/external/bazel_tools/tools/build_defs/repo/http.bzl:372:31: in <toplevel>
ERROR: An error occurred during the fetch of repository 'platforms':
   Traceback (most recent call last):
	File "/private/var/tmp/_bazel_thesayyn/d699b2d85eb10b7585cbabe1226b83c4/sandbox/darwin-sandbox/75/execroot/__main__/_tmp/000223ba99b6c3a2203ec6e8547dd133/_bazel_thesayyn/046bc434811462594c61d09cb4a05a06/external/bazel_tools/tools/build_defs/repo/http.bzl", line 132, column 45, in _http_archive_impl
		download_info = ctx.download_and_extract(
Error in download_and_extract: java.io.IOException: Failed to download repository @platforms: download is disabled.
ERROR: <builtin>: fetching http_archive rule //:platforms: Traceback (most recent call last):
	File "/private/var/tmp/_bazel_thesayyn/d699b2d85eb10b7585cbabe1226b83c4/sandbox/darwin-sandbox/75/execroot/__main__/_tmp/000223ba99b6c3a2203ec6e8547dd133/_bazel_thesayyn/046bc434811462594c61d09cb4a05a06/external/bazel_tools/tools/build_defs/repo/http.bzl", line 132, column 45, in _http_archive_impl
		download_info = ctx.download_and_extract(
Error in download_and_extract: java.io.IOException: Failed to download repository @platforms: download is disabled.
ERROR: /private/var/tmp/_bazel_thesayyn/d699b2d85eb10b7585cbabe1226b83c4/sandbox/darwin-sandbox/75/execroot/__main__/_tmp/000223ba99b6c3a2203ec6e8547dd133/_bazel_thesayyn/046bc434811462594c61d09cb4a05a06/external/local_config_platform/BUILD.bazel:4:9: @local_config_platform//:host depends on @platforms//cpu:aarch64 in repository @platforms which failed to fetch. no such package '@platforms//cpu': java.io.IOException: Failed to download repository @platforms: download is disabled.
ERROR: /Users/thesayyn/Documents/bazel-local-repo-repro/main/BUILD.bazel:1:8: While resolving toolchains for target //:it: Target @local_config_platform//:host was referenced as a platform, but does not provide PlatformInfo
ERROR: Analysis of target '//:it' failed; build aborted: 
INFO: Elapsed time: 4.222s
INFO: 0 processes.
FAILED: Build did NOT complete successfully (2 packages loaded, 0 targets configured)
```