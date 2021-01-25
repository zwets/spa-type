# spa-type

Perform spa typing on _S aureus_ assemblies or reads.

Home: <https://github.com/zwets/spa-type>


## Quick Start

If the prerequisites (see below) are installed on your system, then this will
work:

    $ bin/spa-type reference/J01786.fna
    t303

    $ bin/spa-type --help
    ... command description shows ...


## Background

* spa typing assigns a type _tXXX_ based on the sequence of so-called 'repeats'
  in a region of the _S aureus protein A (spa)_ gene.

* There are ~800 different repeats, each 21-30nt long.  The repeat region (RR)
  contains 1 up to 27 repeats in different combinations.  Each combination
  defines a spa type.

* There are currently ~20,000 combinations (= types), ranging in length between
  21 and 648nt.  Run `wc -l database/spa_db.csv` to see the exact count.

* The authoritative database is hosted at <https://spaserver.ridom.de>, curated
  by <https://seqnet.org>.  The database has:

    * the [type mapping](https://spa.ridom.de/spatypes.shtml)
    * the [repeat sequences](https://spa.ridom.de/repeats.shtml)
    * [type prevalence per country](https://spa.ridom.de/frequencies.shtml)
    * [spa - MLST type combinations](https://spa.ridom.de/mlst.shtml)

* The spa reference is GenBank J01786, _S aureus spa gene coding for protein A_

* Typing proceeds by first picking out the genomic region using (in silico) PCR:

        >forward-primer (1092-1113 on plus)
        TAAAGACGATCCTTCGGTGAGC
        >reverse-primer (1534-1514 on minus)
        CAGCAGTAGTGCCGTTTGCTT

* Followed by selecting the region between these signature sequences:

        >sig-left (1156-1164 on plus; right before the repeat region)
        RCAMCAAAA
        >sig-right (1472-1481 on plus; at +19 or +20 past end of region)
        TAYATGTCGT


## Installation

#### Prerequisites

* The BLAST+ suite (any version), including the `blastn`, `makeblastdb`,
  and `blastdbcmd` commands.
* GNU awk (`gawk`).  A version of awk is most likely installed on your system,
  but note that recent Debian/Ubuntu releases by default install `mawk`, so
  you may need to `apt install gawk`.
* For `update-db.sh` you need `python3` and `wget`.

#### Updating the database

    $ database/update-db.sh
    ... wait for download (a few Mb) to complete ...


---

#### Licence

spa-type - perform spa typing on S aureus assemblies or reads  
Copyright (C) 2021  Marco van Zwetselaar <io@zwets.it>  

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

