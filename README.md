# SimpLuacity
ffxi luas made easy. Currently just a simple, generic lua that can work for any job

This is meant to be a generic lua for anyone to plug-and-play, even if you know nothing about programming.


It's broken up into a few main parts, each with their own functions:
1. Initialization functions - these run when you swap to the job associated with the lua
    a. function get_sets()
    b. function job_setup()
2. Job Specific setups - Still initialization but you can change these if you want to
    a. user_setup()
    b. user_unload()
3. The gear sets - Self-explanatory
    a. Precasts
    b. Midcasts
    c. Idle sets
    d. Engaged sets
    e. Aftermath set(s)
    f. Examples of some edge cases
4. Hooks - Additional logic
    a. job_post_midcast()
    b. job_state_change()
    c. customize_idle_set()
    d. check_gear()
    e. windower.register_event('Zone Change')


1a. You don't need to worry about these. You can include global key binds (if using numerous luas) 

1b. Two things you can add here: pieces that wont get swapped out if you manually equip them, and lockstyle on job swap

2a. This is where the states are defined and keys are bound(if you don't want a separate doc) The states.mode:options() format is required to function but 
    you can add/remove the options within the parens and then add/remove gear sets accordingly. Don't touch WeaponLock.

2b. unloads your keybinds when you swap jobs or unload GearSwap (//lua unload gearswap)

3. Lines 62 - 497. This is the majority of the lua and what makes them *seem* long
        - Pretty straight forward, put in the pieces, delete or comment out lines/blocks you dont use
        
        - Filling these out is extremely tedious. I HIGHLY recommend equiping the pieces you want for a set then using //gs export 
        which will create a lua in windower -> addons -> gearswap -> data -> export where you can just copy/paste the set over. 
        
        -If you're manually filling these out, make sure you don't leave any hanging variables(main =    OR main = "") this can mess up the automation. 
        Either delete that line or you can just add "--" to the front to turn it into a comment until you have a piece to put there

        -if you create more states to cycle through, create them here (just copy/paste, follow formatting, and match the name to your new one)

        - Just delete any blocks you don't need for the job. 

        - You can use set_combine to equip specific pieces for specific spells within a category or to override, 
        examples are listed at the bottom of Precasts but this is the syntax:
        SETNAME[CATEGORY/ABILITYNAME] = set_combine(SETNAME, {slot = 'piece'})

        - If you create a set for a specific spell, and want it for another one, just create that new one and set it equal to the other.
        For example, if you make a protect set and want it for protectra as well:
        sets.midcast.Protectra = sets.midcast.Protect

4. these are just functions to add some extra logic, their purpose is listed in the doc.


