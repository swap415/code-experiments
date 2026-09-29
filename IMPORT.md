# Import notes

This copy was prepared on 2026-09-29 from the ignored `issues/` directory in
the local Numba checkout. The source directory was left intact. Human-authored
scripts, notes, small reports, folded stacks, and flamegraphs were copied with
their relative paths preserved. Host and local-user identifiers in retained
transcripts were redacted; measurements were not changed.

The source tree held 603 files at export time, about 904 MiB on disk. The
Git candidate contains 215 files, about 4.1 MB. The excluded material was
generated: 14 `*.data` perf captures alone totaled
931,228,644 bytes, with additional JIT ELF files, compiled extensions,
bytecode caches, object files, and raw perf stacks. `caching/` and `numpy24/`
contained only caches. `shap_bench/COPY-NOTES.md` was a local transfer record,
and `shap_bench/diff/host.txt` contained a machine inventory.
The full-bundle `shap_bench/diff/READ-ME.txt` and `SHA256SUMS` are retained as
`FULL-BUNDLE-NOTES.txt` and `FULL-BUNDLE-SHA256SUMS`. They document omitted
raw files; their full-bundle checksum verification requires the original
archive. The curated copy has its own README and retains `sources.sha256` for
the two kernel source snapshots.

Keep the original raw captures in separate storage if they are needed for
later analysis. They require matching Linux binaries, debug symbols, and
paths; the compact reports in this repository are sufficient to read the
recorded conclusions. Do not commit raw captures to Git history. GitHub warns
above 50 MiB per file and blocks ordinary Git files above 100 MiB.
