# Install pip, a package manager for python
file=/tmp/get-pip.py

curl -fsSL https://bootstrap.pypa.io/get-pip.py >> $file

python3 $file

rm $file