#!/usr/bin/env bash
# Loads each Prolog program, runs its main query and checks that it finds a solution.
set -uo pipefail
cd "$(dirname "$0")/.."

failed=0
check() {
  local name="$1" file="$2" goal="$3"
  echo "== $name"
  if swipl -q -g "($goal -> true ; (writeln('NO SOLUTION'), halt(1)))" -t halt "$file"; then
    echo "ok"
  else
    echo "FAILED: $name"
    failed=1
  fi
}

# Path to safety: start at (1,0) with 0 stars, reach the finish at (2,2) without stepping on a bomb.
check "path to safety" prolog/path_to_safety.pl \
  "play(s(1,0,0,_), Path, Stars), format('path=~w stars=~w~n', [Path, Stars])"

# Resource allocation graph: all four processes can finish, so the order has four elements.
check "resource allocation graph" prolog/resource_allocation_graph.pl \
  "completed(Order), length(Order, 4), format('finish order=~w~n', [Order])"

# Missionaries and cannibals: move everybody from the left bank to the right bank.
check "missionaries and cannibals" prolog/missionaries_cannibals.pl \
  "game(s(0,0,0,0,0,0), Steps), length(Steps, N), format('steps=~w~n', [N])"

exit "$failed"