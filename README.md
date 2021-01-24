# spa-type

Performs spa typing on _S aureus_ assemblies or reads.


## Background

* spa typing assigns a type _tXXX_ based on the sequence of so-called 'repeats'
  in a specific region of the _S aureus protein A (spa)_ gene.

* There are ~800 different repeats, each 21-30nt long.  The repeat region (RR)
  contains 1 up to 27 repeats in different combinations.  There currently are
  ~20,000 combinations (= types), ranging in length between 21 and 648nt.

* Authoritative database is hosted at <https://spaserver.ridom.de>, curated by
  <https://seqnet.org>.  The database has

    * the [type mapping](https://spa.ridom.de/spatypes.shtml)
    * the [repeat sequences](https://spa.ridom.de/repeats.shtml)
    * furthermore, it has prevalence per country, and combination with MLST

* The spa reference is GenBank J01786, _S aureus spa gene coding for protein A_

* Primers to select the region:

        >spa-1113f (1092-1113 on plus)
        TAAAGACGATCCTTCGGTGAGC
        >spa-1514r (1534-1514 on minus)
        CAGCAGTAGTGCCGTTTGCTT

* Signatures that must be present (note R=[GA], Y=[TC], M=[AC]):

        >spa-lhs (1156-1164 on plus; right before start of repeat region)
        RCAMCAAAA
        >spa-rhs (1472-1481 on plus; at +19 or +20 after end of repeat region
        TAYATGTCGT


## Installation

#### Install prerequisites

    @TODO@

#### Download database

    cd database
    ./make-spa-db.sh

#### Run the spa typer

    ./spa-type file.fna
    ./spa-type file_1.fq file_2.fq

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

