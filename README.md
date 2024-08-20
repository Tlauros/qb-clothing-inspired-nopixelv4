#                                            qb-clothing v4 
Hello, Dev Fivem today I am going to Fixed and adding Features another UI script. **This is a modified UI version of [**qb-clothing**](https://github.com/qbcore-framework/qb-clothing) and it's totally free.** 
<br>
UI : https://github.com/Reload-X
<br>
Fix and Add Features (Blacklist) By : https://github.com/Tlauros
![image](https://github.com/Reload-X/qb-clothing/assets/167034229/555afdc0-bd5d-4d46-852d-f3b78287ecdf)


## **Features (All same as default qb-clothing)**

* Configurable Ped Selection
* Detailed nose, chin, jaw, cheek, etc. configuration
* Camera Rotating
* 3 Different Camera Angles
* Clothing Stores
* Black List Clothings for Shops (is good for Anti Abusing) 
* Barbers
* Job Locker Rooms (Configurable Outfit Presets)
* Saveable Outfits
## **Preview Blacklist clothes**
```
Config.Blacklist = { ---Config 
    male = {
        components = {
            face = {},
            face2 = {},
            mask = {138},  ----- masks ---> mask
            arms = {}, ------> upperBody  --> arms
            pants = {},  -------> lowerbody -> pants
            bag = {},  -----> bags ---> bag
            shoes = {},  ---> shoes
            accessory = {}, ----scar and chain --> accessory
            ["t-shirt"] = {256,257,258,259,260,261,262},
            vest = {},  ---- bodyarmor --> vest
            decals = {}, ---- Decals
            torso2 = {796},  ----toros2
            hat = {},  ---> hats ---> hat  --214 benevis
            glass = {},
            ear = {},
            watch = {},
            bracelet = {},
            ["hair"] = {},
            eye_color = {},
            moles = {},
            nose_0 = {},
            nose_1 = {},
            nose_2 = {},
            nose_3 = {},
            nose_4 = {},
            nose_5 = {},
            eyebrown_high={},
            eyebrown_forward={},
            cheek_0={},
            cheek_1={},
            cheek_2={},
            cheek_3={},
            eye_opening = {},
            lips_thickness = {},
            jaw_bone_width = {},
            jaw_bone_back_lenght = {},
            chimp_bone_lowering = {},
            chimp_bone_lenght = {},
            chimp_bone_width = {},
            chimp_hole = {},
            neck_thikness = {},
            ageing = {},
            eyebrows = {},
            lipstick = {},
            beard = {},
            blush = {},
            makeup = {},
        },
    },
    female = {
        components = {
            face = {},
            face2 = {},
            mask = {111,237},  ----- masks ---> mask
            arms = {8}, ------> upperBody  --> arms
            pants = {143},  -------> lowerbody -> pants
            bag = {},  -----> bags ---> bag
            shoes = {},  ---> shoes
            accessory = {}, ----scar and chain --> accessory
            ["t-shirt"] = {},
            vest = {},  ---- bodyarmor --> vest
            decals = {}, ---- Decals
            torso2 = {},  -----jackets --> toros2
            hat = {},
            glasses = {},
            ear = {},
            watch = {},
            bracelets = {},
            ["hair"] = {},
            eye_color = {},
            moles = {},
            nose_0 = {},
            nose_1 = {},
            nose_2 = {},
            nose_3 = {},
            nose_4 = {},
            nose_5 = {},
            eyebrown_high={},
            eyebrown_forward={},
            cheak_0={},
            cheak_1={},
            cheak_2={},
            cheak_3={},
            eye_opening = {},
            lips_thickness = {},
            jaw_bone_width = {},
            jaw_bone_back_lenght = {},
            chimp_bone_lowering = {},
            chimp_bone_lenght = {},
            chimp_bone_width = {},
            chimp_hole = {},
            neck_thikness = {},
            ageing = {},
            eyebrows = {},
            beard = {},
            blush = {},
            makeup = {},
        }
    }
}
```
## **Manual**

* Download the script and put it in the `[qb]` directory.
* Import `qb-clothing.sql` in your database
* Add the following code to your server.cfg/resources.cfg

  `ensure qb-clothing`

  Discord : tlauros#5905
