# install unison
unison_ver=2.48.3
wget http://www.seas.upenn.edu/~bcpierce/unison//download/releases/unison-${unison_ver}/unison-${unison_ver}.tar.gz
wget http://caml.inria.fr/pub/distrib/ocaml-4.02/ocaml-4.02.3.tar.gz
tar xvf unison-${unison_ver}.tar.gz
tar xvf ocaml-4.02.3.tar.gz
cd ocaml-4.02.3
./configure
gmake world && gmake opt && sudo gmake install
cd ../unison-${unison_ver}
gmake
mkdir -p ~/bin
mv ./unison ~/bin
sudo chown root ./unison-fsmonitor
mv ./unison-fsmonitor ~/bin
