# Standard Medical Items

This plugin uses only standard Helix player health. It does not require a damage, limb, blood, shock, unconsciousness, bed, or skills plugin.

Medical items belong in `items/medical_standard`, which automatically gives them the `base_medical_standard` base, and can define:

- `healAmount`: health restored after treatment completes.
- `armorAmount`: armor restored after treatment completes.
- `maxArmor`: armor cap for this item, default `100`.
- `useTime`: treatment duration in seconds.
- `dUses`: default number of uses stored on the item.
- `useSound`: optional sound played on the patient.

The `Use` action treats the owner. The `Treat target` action treats the player being looked at, including players whose live body is represented by a Helix ragdoll entity. Target treatment is cancelled if the user looks away or the target is no longer valid. Self-treatment is cancelled only if the user is no longer valid or dies. Each successful treatment consumes one item.

All item and treatment text is written directly in Russian in the item files and base item.

To create an item, place a shared item file in this plugin's `items/medical_standard` directory:

```lua
ITEM.name = "Field Dressing"
ITEM.healAmount = 20
ITEM.useTime = 5
ITEM.dUses = 4
```