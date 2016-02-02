#!/bin/bash

mkdir tree-tagger
cd tree-tagger/
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tree-tagger-linux-3.2.tar.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/tagger-scripts.tar.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/install-tagger.sh
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/dutch-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/english-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/german-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/italian-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/latin-par-linux-3.2.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/portuguese-par-linux-3.2-utf8.bin.gz
wget http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/spanish-par-linux-3.2-utf8.bin.gz
chmod +x install-tagger.sh 
./install-tagger.sh
rm *.gz