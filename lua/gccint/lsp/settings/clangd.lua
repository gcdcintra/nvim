return {
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--offset-encoding=utf-16",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--pch-storage=memory",
        "--clang-tidy-checks=-*,clang-analyzer-*",
        "--query-driver=/usr/bin/clang++",
    },
}
