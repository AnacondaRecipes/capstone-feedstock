pushd bindings\python
:: make install3
:: make install3_cython
%PYTHON% setup.py install --single-version-externally-managed --record record.txt
