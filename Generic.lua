-------------------------------------------------------------------------------------------------------------------------------------
--Initialization functions
-------------------------------------------------------------------------------------------------------------------------------------

function get_sets()
    mote_include_version = 2

    include('Mote-Include.lua')
    --include('Global-Binds.lua') <- If you want global binds for all jobs just make a lua and include it instead of copy/pasting
end

function job_setup()
    state.RegenMode = M{['description']='Regen Mode', 'Duration', 'Potency'}

    --Put pieces you manually equip and don't want unequipped here
    no_swap_gear = S{"Warp Ring", "Trizek Ring", "Echad Ring"," Endorsement ring", "Aptitude Mantle", "Aptitude Mantle +1", }

    --lockstyleset = # if you want to auto lockstyle on job swap
end

-------------------------------------------------------------------------------------------------------------------------------------
--Job specific functions
-------------------------------------------------------------------------------------------------------------------------------------

-- create states you can swap between for each category, leave WeaponLock as is
function user_setup()
    state.OffenseMode:options('Standard', 'Accurate', 'Aftermath')
    state.CastingMode:options('Standard','Resistant')
    state.IdleMode:options('DT','Refresh')
    state.WeaponLock = M(false, 'Weapon Lock')

--You can cycle states to make some things easier. Define the states here then cycle by binding it to a key in the next section
    --state.BarElement = M{['description']='BarElement', 'Barfira', 'Barblizzara', 'Baraera', 'Barstonra', 'Barthundra', 'Barwatera'}
    --state.BarStatus = M{['description']='BarStatus', 'Baramnesra', 'Barvira', 'Barparalyzra', 'Barsilencera', 'Barpetra', 'Barpoisonra', 'Barblindra', 'Barsleepra'}
    --state.BoostSpell = M{['description']='BoostSpell', 'Boost-STR', 'Boost-INT', 'Boost-AGI', 'Boost-VIT', 'Boost-DEX', 'Boost-MND', 'Boost-CHR'}

-- This is where you bind keys if you want everything in one doc
    send_command('bind f9 gs c cycle OffenseMode')
    send_command('bind f10 gs c cycle CastingMode')
    send_command('bind f11 gs c cycle DefenseMode')
    send_command('bind f12 gs c cycle IdleMode')
    --send_command('bind ^home gs c cycleback BarElement') <- example of the state cycling from above ^
    --send_command('bind ^end gs c cycle BarElement')      <- example of the state cycling from above ^
    
    --send_command('bind ^` input /ja "Afflatus Solace" <me>') <- can bind text input as well
    --send_command('bind !` input /ja"Afflatus Misery" <me>')
end

-- This is where you unbind keys if you want everything in one doc
function user_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    --send_command('unbind ^`')
    --send_command('unbind !`')


end

-------------------------------------------------------------------------------------------------------------------------------------
-- Define your sets with this function. NAMES OF SETS MUST BE NAMED PROPERLY (CASE SENSITIVE)
-- Windower -> addons -> GearSwap -> libs -> Mote-include.lua lists all of the ones you can use. 
-- Lines 112 - 135 have the common ones
-------------------------------------------------------------------------------------------------------------------------------------
function init_gear_sets()
-------------------------------------------------------------------------------------------------------------------------------------
--Precasts
-------------------------------------------------------------------------------------------------------------------------------------
    sets.precast.FC = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }


    sets.precast.FC.Cure = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

    sets.precast.WS = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }


--Use combines like this to override specific slots. e.g. siegel sash for stoneskin
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist = 'Siegel Sash',
        })

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {
        neck="Caro Necklace",
        })

    sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {
        head="Blistering Sallet +1",
        ring2="Begrudging Ring",
        })

    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
        ammo="Ghastly Tathlum +1",
        head=empty,
        body="Cohort Cloak +1",
        legs="Kaykaus Tights +1",
        })


-------------------------------------------------------------------------------------------------------------------------------------
--Midcasts, these are just examples so you can see syntax and/or copy/paste
-------------------------------------------------------------------------------------------------------------------------------------
    sets.midcast.FC = sets.precast.FC

    sets.midcast.ConserveMP = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

    sets.midcast.Cure = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

    sets.midcast.Curaga = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

-------------------------------------------------------------------------------------------------------------------------------------
--Idle Sets
-------------------------------------------------------------------------------------------------------------------------------------
    sets.idle.DT = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

    sets.idle.Refresh = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

    sets.idle.GottaGoFast = set_combine(sets.idle.DT,{
        feet ="Herald's Gaiters"
    })
-------------------------------------------------------------------------------------------------------------------------------------
--Engaged Sets
-------------------------------------------------------------------------------------------------------------------------------------
    sets.engaged = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }
    
    sets.engaged.Accurate = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }
-------------------------------------------------------------------------------------------------------------------------------------
--Aftermath Set(s)
-------------------------------------------------------------------------------------------------------------------------------------
    sets.engaged.Aftermath = {
        main="",
        sub="",
        ammo="",
        head="",
        body="",
        hands="",
        legs="",
        feet="",
        neck="",
        ear1="",
        ear2="",
        ring1="",
        ring2="",
        back="",
        waist="",
        }

end

-------------------------------------------------------------------------------------------------------------------------------------
--Hooks for events, this is where all the logic is ORDER MATTERS HERE, IT SIGNIFIES PRIORITY
-------------------------------------------------------------------------------------------------------------------------------------


-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end

-- Prevents the no_swap_gear from being swapped out
function check_gear()
    for slot, equipname in pairs(player.equipment) do
        if no_swap_gear:contains(equipname) then
            disable(slot)
        else   
            enable(slot)
        end
    end
end

-- Swaps to idle set when you zone
windower.register_event('zone change',
    function()
        if no_swap_gear:contains(player.equipment.left_ring) then
            enable("ring1")
            equip(sets.idle)
        end
        if no_swap_gear:contains(player.equipment.right_ring) then
            enable("ring2")
            equip(sets.idle)
        end
    end
)
