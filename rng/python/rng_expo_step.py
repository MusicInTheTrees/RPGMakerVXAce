# -*- coding: utf-8 -*-
"""
Created on Sun Apr 16 00:50:38 2023

@author: MusicInTheTrees
"""

import random

# g_base
# NOTE: This is the base of the center value of the 
# randomly generated number
g_base = 2

# g_expFactor
# NOTE: This is the shrink or growth factor of the exponent
# (to the base of the random gen number center value)
g_expFactor = 0.88 # 0.88

# g_boundFactor
# NOTE: This factor determines the range of random gen
# number once the center value is found
g_boundFactor = 0.8

# g_ascendPercent 
# NOTE: this will determine what the difficulty in
# ascending to the next round of random number gen
# 0.73 good for startLevel = 0
# It needs to move up as startLevel increases
g_ascendPercent = 0.73

# g_ascensionLimit
# NOTE: This determines how many times the random gen
# loop can ascend - it ultimately decides how large of
# a number can be generated
g_ascensionLimit = 20

# g_ascensionHandicapStep
# NOTE: This value is (optionally)added to 'rngAscendPercent'
# as the value of 'initAscLvl' increases
g_ascensionHandicapStep = 0.2

def coerce(val, lwr, upr):
    if val < lwr:
        return lwr
    elif val > upr:
        return upr
    else:
        return val

def expo_step(level = 0, scalar = 0, expFactor = -1):
    # center = scalar + base ^ (exp * expFactor)
    global g_expFactor, g_base, g_boundFactor
    global g_ascendPercent, g_ascensionLimit
    
    if (expFactor < 0):
        expFactor = g_expFactor
        
    level = coerce(level, 0, g_ascensionLimit)
    
    level = level * expFactor
    
    center = scalar + (g_base ** level)
    
    return center

def rng_step(startLevel = 0, useHandicap = False):
    global g_ascendPercent, g_ascensionLimit, g_ascensionHandicapStep
    
    startLevel = coerce(startLevel, 0, g_ascensionLimit)
    
    step = 0
    ascThreshold = round(100 * g_ascendPercent)
    ascensionHandicapPercent = g_ascendPercent
    
    if (True == useHandicap):
        ascensionHandicapPercent += startLevel * g_ascensionHandicapStep
        # coerce
        if (ascensionHandicapPercent > 0.99):
            ascensionHandicapPercent = 0.99
    
    for step in range(startLevel, g_ascensionLimit):
        guess = random.randint(0, 100)
        
        # As the step/ascension increases, so does the difficulty to get to the
        # next step/ascension
        if (True == useHandicap):
            ascensionHandicapPercent += g_ascensionHandicapStep
            
            # coerce
            if (ascensionHandicapPercent > 0.99):
                ascensionHandicapPercent = 0.99
            
            ascThreshold = round(ascensionHandicapPercent * 100)
            
        if (guess < ascThreshold):
            break
    return step

def rng_expo_step(startLevel = 0, scalar = 0, useHandicap = False):
    # center = scalar + base ^ (exp * expFactor)
    global g_expFactor, g_base, g_boundFactor
    
    startLevel = coerce(startLevel, 0, g_ascensionLimit)
    
    exp = rng_step(startLevel, useHandicap)
            
    exp *= g_expFactor
        
    center = g_base ** exp
    left = round(g_boundFactor * center)
    right = round(center * (2 - g_boundFactor))
    
    return scalar + random.randint(left, right)

if __name__ == "__main__":
    DBG_CENTER = 0
    DBG_CURVE = 1
    DBG_RNG = 2
    
    DEBUG = DBG_RNG
    
    outputStr = ""
    
    if DBG_CENTER == DEBUG:
        level = 0
        outputStr = expo_step(level)
        print(outputStr)
    elif DBG_CURVE == DEBUG:
        curve = [0]
        for i in range(g_ascensionLimit):
            point = expo_step(i)
            curve.append(point)
            outputStr = "point: {0}\n delta: {1}".format(point, curve[i+1] - curve[i])
            print(outputStr)
    elif DBG_RNG == DEBUG:
        
        startLevel = 1
        for i in range(100):
            outputStr += str(rng_expo_step(startLevel, 0, False)) + ","
        
        print(outputStr)
        
    else:
        print("Bad debug selection")
