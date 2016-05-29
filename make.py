from os import listdir
from os.path import isfile, join
from subprocess import call


for file in [f for f in listdir('src/Pages/') if f.endswith('.elm')]:
    call(['elm', 'make', 'src/Pages/' + file, '--output=src/static/scripts/' + file[:-4] + '.js'])