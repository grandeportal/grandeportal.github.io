# Install pyenv
# Prepare your ~/.bashrc on Linux
# Install pip

# Type:
# wget -O powerpyenv.sh https://goo.gl/691UDZ
# source powerpyenv.sh

# python version
python -V

# install packages
sudo apt-get install -y curl git git-cola vim wget xclip

# install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev
# https://github.com/yyuu/pyenv-installer#github-way-recommended
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# clean up
sudo apt-get autoremove
sudo apt-get autoclean

# Verify installed versions
# pyenv versions

# List versions
# pyenv install -l

# Install Python 3.5.0
eval "$(pyenv init -)"
pyenv install 3.5.0
pyenv global 3.5.0

pyenv versions

# python version
python -V

# Install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

# Install virtualenv
sudo pip install virtualenv

# Prepare ~/.bashrc

cat << EOF > temp.txt
### Added by pyenv
export PATH="\$HOME/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"

### Activate virtualenv
alias manage="python \$VIRTUAL_ENV/../manage.py"
alias r="manage runserver"
alias sa='source .venv/bin/activate; PS1="(\`basename \"\$VIRTUAL_ENV\"\`)\e[1;34m:/\W\e[00m$ "; clear'

### Short prompt
alias pa='PS1="(\`basename \"\$VIRTUAL_ENV\"\`)\e[1;34m:/\W\e[00m$ "; clear'
alias p='PS1="\e[1;34m/\W\e[00m$ "; clear'

alias rm="rm -i"
EOF

cat temp.txt >> ~/.bashrc
rm -f temp.txt

source ~/.bashrc

echo "Done"