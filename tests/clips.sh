#!/usr/bin/env bash
# Loads each CLIPS program, runs it and checks the printed output.
set -uo pipefail
cd "$(dirname "$0")/.."

failed=0
run_clips() { # file, extra input line (optional)
  local file="$1" extra="${2:-}"
  if [ -n "$extra" ]; then
    printf '(load "%s")\n(reset)\n(run)\n%s\n(exit)\n' "$file" "$extra" | clips
  else
    printf '(load "%s")\n(reset)\n(run)\n(exit)\n' "$file" | clips
  fi
}
expect() { # name, output, text that must appear
  if grep -q "$3" <<<"$2"; then echo "ok: $1"; else echo "FAILED: $1 (missing '$3')"; failed=1; fi
}

out=$(run_clips clips/patient_records.clp)
echo "$out"
expect "patient records" "$out" "My Name is  Andrew"

out=$(run_clips clips/family_relations.clp)
echo "$out"
expect "family relations (parent)" "$out" "is a Parent"
expect "family relations (grandfather)" "$out" "is a GrandFather"

out=$(run_clips clips/factorial.clp 5)
echo "$out"
expect "factorial of 5" "$out" "=120"

exit "$failed"