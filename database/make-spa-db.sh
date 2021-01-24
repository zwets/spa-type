#!/bin/sh
#
# make-spa-db.sh - download and combine the type and repeat definitions
#

# Download spatypes.txt and sparepeats.fasta

[ -f "sparepeats.fasta" ] || wget -qO - https://spa.ridom.de/dynamic/sparepeats.fasta | tr -d '\r' > sparepeats.fasta
[ -f "spatypes.txt" ] || wget -qO - https://spa.ridom.de/dynamic/spatypes.txt | tr -d '\r' > spatypes.txt

# Generate spa_db.fna

python3 -c '
import sys, re, operator

seqs = dict()
seq_id = None
seq = None

# Read the fasta file into the seqs dict
with open("sparepeats.fasta", "r") as f:
    pat = re.compile(">r(\\d+)")
    for line in filter(None, map(operator.methodcaller("strip"), f)):
        mat = pat.match(line)
        if mat: # we hit a sequence header
            seq_id = mat.group(1)
            seqs[seq_id] = ""
        else:   # we hit a line of data
            seqs[seq_id] += line

# Reads the spa types definitions and output full seqs
with open("spatypes.txt", "r") as f:
    for line in filter(None, map(operator.methodcaller("strip"), f)):
        tnum, rnums = line.split(",")
        if not tnum or not rnums:
            print("warning: skipping invalid line: %s" % line, file=sys.stderr, flush=True)
            continue
        tseq = ""
        for seq_id in rnums.split("-"):
            seq = seqs.get(seq_id)
            if not seq:
                print("warning: skipping %s: undefined repeat: %s" % (tnum,seq_id), file=sys.stderr, flush=True)
                tseq = ""
                break
            tseq += seq
        if tseq:
            print(">%s" % tnum)
            print(tseq)
' >spa_db.fna

