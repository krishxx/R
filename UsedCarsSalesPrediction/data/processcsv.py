# -*- coding: utf-8 -*-
"""
Created on Wed Jan 17 06:16:25 2018

@author: Srikrishna.Sadula
"""

def process_split(filename, fpout):
    with open(filename, 'r') as fpin:
        count = 0
        for line in fpin:
            if(count<50000):
                fpout.write(line)
            else:
                break;
            count = count + 1
            
with open('autos50k.csv', 'w') as fpout:
    #output file created    
    process_split('autos.csv', fpout)

'''
def impute_normalization(filename):
    with open(filename, 'r') as fpin:
'''