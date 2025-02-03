--- STEAMODDED HEADER
--- MOD_NAME: Chudjoker
--- MOD_ID: chudjoker
--- MOD_AUTHOR: [dogwearingdurag]
--- MOD_DESCRIPTION: Nothing. Ever. Happens.
--- PREFIX: xmpl
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'Jokers', --atlas key
    path = 'Jokers.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}

SMODS.Joker {
    key = 'Joker',
    loc_txt = {
        name = 'Chudjoker',
        text = {
            "All {C:attention}listed {C:green,E:1,S:1.1}probabilities{} have", "a near zero chance of occuring.", "{C:blue}Nothing. Ever. Happens."
        }
    },
    atlas = 'Jokers', --atlas' key
    rarity = 2,
    cost = 6,
    unlocked = true, --whether it is unlocked or not
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = false, --can it be eternal
    perishable_compat = false,
    pos = { x = 0, y = 0 }
}

local add_to_deckref = Card.add_to_deck
function Card.add_to_deck(self, from_debuff)
    if not self.added_to_deck then
        if self.ability and self.ability.name == 'j_Chudjoker_Joker' then
            for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = v / 1000
            end
        end
    end
    add_to_deckref(self, from_debuff)
end

local remove_from_deckref = Card.remove_from_deck
function Card.remove_from_deck(self, from_debuff)
    if self.added_to_deck then
        if self.ability and self.ability.name == 'j_Chudjoker_Joker' then
            for k, v in pairs(G.GAME.probabilities) do 
                G.GAME.probabilities[k] = v * 1000
            end
        end
    end
    remove_from_deckref(self, from_debuff)
end