#!/usr/bin/env python3
#
# Bulgarian Solitaire

import sys

board = tuple(int(x) for x in sys.argv[1:])

seen = set()

while board not in seen:
    print(board)
    seen.add(board)
    board = tuple(x - 1 for x in board if x > 1) + (len(board),)
