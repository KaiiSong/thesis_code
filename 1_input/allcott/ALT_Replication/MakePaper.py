'''
#-------------------------------------------

PURPOSE

This script produces the entire project, from 
initial data to compiling the paper pdf

#------------------------------------------

REQUIREMENTS

Python 2.7.x
Python Library: Pip
Stata
LyX 2.2
MATLAB

#----------------------------------------

IMPORTANT

1) The main package that runs all of the files is gslab_scons. To download
this package, you must have installed pip. 

In the event that you pip is installed and the installation still doesn't work
you must download gslab_scons manually. This can be done by going to:
https://github.com/gslab-econ/gslab_python

2) To run this script, you must ensure that all of the required programs
are installed and in your PATH Environment. 
How to add programs depends on your operating system. 

For UNIX-based system:
open either ~/.bash_profile or ~/.bash_rc using a text editor
(Look up to see which one you should use on your computer)

and add the following command:
export PATH=$PATH:(Location of Your Stata Directory)
e.g. export PATH=$PATH:/usr/local/stata14

For Windows-based system:
Go to the System Control Panel applet, select the advanced tab, 
click the Environment Variables Button, select PATH and then click edit.
Then add the following directories to the PATH:

C:\Program Files (x86)\LyX 2.2\bin
C:\Program Files (x86)\Stata14
C:\Program Files\MATLAB\R2017b\bin

#--------------------------------------------

USEFUL COMMENTS 

1) To run a program in this script, we use the build_program() function 
in gslab_scons, where program is a specific program you wish to run, i.e. 
R, stata, lyx, etc. To see the full list of programs available, see:
https://github.com/gslab-econ/gslab_python/tree/master/gslab_scons/builders

2) The basic structure of gs.build_program(source, target, env) is:
source = "Location of file you want program to run relative to location of this file"
target = "Location and name of file you want program to send output to"
env = Dictionary of any command-line arguments you want to pass to function 

3) gs.build_stata(): The env{} argument must be nonempty and specify the 
type of stata used, i.e. stata, stata-mp, or stata-se. 
Passing None will have gs.build_stata() look for stata on your computer
but if you want, you can specify your flavor instead.

'''
#---------------------------------------

#Import packages 

import os
import shutil

try:
	import gslab_scons as gs #Note: This is an uncommon library.
except ImportError: 
	try: 
		import pip
	except ImportError:
		print("Error: You must download the Python library 'pip'")
		print("Exiting...")
		exit()
	
	pip.main(['install', 'git+https://git@github.com/gslab-econ/gslab_python.git'])
	try: 
		import gslab_scons as gs
	except ImportError:
		print('Error: Unable to install the required library gslab_scons')
		print('Download the required library: https://github.com/gslab-econ/gslab_python')
		print('Exiting...')
		exit()

#-------------------------------------------------
'''
#Delete contents of ouput directory
import glob sh

files = glob.glob('/Output/temp_test/*')
sh.rm(files)


if os.path.isdir(OutDir):
	shutil.rmtree(OutDir)
os.mkdir(OutDir)
'''

#-------------------------------------------

# Build the paper

# Run Stata code
try:
	gs.build_stata(source = 'Code/OptimalSodaTaxMasterFile_test.do', 
		target = 'Output/Analysis/', 
		env = {'stata_executable': None} 
		)
except UnboundLocalError:
	print('Error: You must include Stata in your PATH Environment')
	print('See "IMPORTANT NOTE #2" in this script for details')
	print('Exiting...')
	exit()


# Run MATLAB Code
try:
        gs.build_matlab(source = 'Code/Simulations/run_simulations_test.m',
                target = 'Output/Simulations/',
		env = {} 
		)
except UnboundLocalError:
	print('Error: You must include MATLAB in your PATH Environment')
	print('See "IMPORTANT NOTE #2" in this script for details')
	print('Exiting...')
	exit()


# Compile the slides
try:
        os.remove('Output/Lyx/ALT_Slides.pdf')
except OSError:
        pass

gs.build_lyx(source = 'Code/Lyx/ALT_Slides.lyx', 
	target = 'Output/Lyx/ALT_Slides.pdf', 
	env = {}
	)


