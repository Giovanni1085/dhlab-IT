#!/bin/bash
#
# install pyenv
# taken from http://amaral-lab.org/resources/guides/pyenv-tutorial
cd
git clone git://github.com/yyuu/pyenv.git .pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

#
# create a virtualenvironment
#
pyenv install 2.7.6
pyenv virtualenv 2.7.6 phd-py2
pyenv activate phd-py2
#
# Install the CRF++ bindings
#
cd CRF++-0.58/
pip install -e python/
cd
#
# install some libraries needed to run my processing
#
pip install pymongo parmap pytest jupyter
#
# Install the CitationExtractor
#
wget https://github.com/mromanello/CitationExtractor/archive/v1.4.x.zip
unzip v1.4.x.zip 
rm v1.4.x.zip
mv CitationExtractor-1.4.x CitationExtractor
cd CitationExtractor
pip install -e lib/
pip install -U -r requirements.txt .
# Run the tests
py.test citation_extractor
#
# Download the APhCorpus
#
cd
wget https://github.com/mromanello/APh_Corpus/archive/master.zip
unzip master.zip 
mv APh_Corpus-master/ APh_Corpus/
rm master.zip
#
# Install the CitationParser
#
wget https://github.com/mromanello/CitationParser/archive/master.zip -O citation_parser.zip
unzip citation_parser.zip
mv CitationParser-master/ CitationParser/
rm citation_parser.zip
cd CitationParser/
pip install -U -r requirements.txt .

#
# Download brat
#
cd
wget https://github.com/nlplab/brat/archive/master.zip -O brat.zip
unzip brat.zip
rm brat.zip
mv brat-master/ brat/