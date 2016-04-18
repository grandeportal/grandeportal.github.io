sed -n "/pattern/{=;p}" arquivo

sed -n "/*/{=;p}" gp.md | sed "{N;s/\n/ /}" > gp2.md

cat -n gp.md > gp2.md

awk '{printf("%5d: %s\n", NR,$0)}' gp.md > gp2.md

