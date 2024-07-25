--######################--
--      Tlauros Dev  ----------
--                            |
--                            v
--      Dev : QB-core + (Just addet features --> Blacklist Clothes)
--      Version : 3.0
--######################--

Config = Config or {}

Config.WomanPlayerModels = {
    'mp_f_freemode_01',
}

Config.ManPlayerModels = {
    'mp_m_freemode_01',
}
Config.LoadedManModels = {}
Config.LoadedWomanModels = {}

-- Set to true or false or GetConvar('UseTarget', 'false') == 'true' to use global option or script specific
-- These have to be a string thanks to how Convars are returned.
Config.UseTarget = GetConvar('UseTarget', 'false') == 'false'

-- width, length, minZ and maxZ are for the size and height of the PolyZone
Config.Stores = {
    [1] = {shopType = 'clothing', coords = vector3(1693.32, 4823.48, 42.06), width = 2, length = 2},
    [2] = {shopType = 'clothing', coords = vector3(-712.215881, -155.352982, 38.4151268), width = 2, length = 2},
    [3] = {shopType = 'clothing', coords = vector3(-1192.94495, -772.688965, 18.3255997), width = 2, length = 2},
    [4] = {shopType = 'clothing', coords = vector3(425.236, -806.008, 29.491), width = 2, length = 2},
    [5] = {shopType = 'clothing', coords = vector3(-162.658, -303.397, 39.733), width = 2, length = 2},
    [6] = {shopType = 'clothing', coords = vector3(75.950, -1392.891, 29.376), width = 2, length = 2},
    [7] = {shopType = 'clothing', coords = vector3(-822.194, -1074.134, 11.328), width = 2, length = 2},
    [8] = {shopType = 'clothing', coords = vector3(-1450.711, -236.83, 49.809), width = 2, length = 2},
    [9] = {shopType = 'clothing', coords = vector3(4.254, 6512.813, 31.877), width = 2, length = 2},
    [10] = {shopType = 'clothing', coords = vector3(615.180, 2762.933, 42.088), width = 2, length = 2},
    [11] = {shopType = 'clothing', coords = vector3(1196.785, 2709.558, 38.222), width = 2, length = 2},
    [12] = {shopType = 'clothing', coords = vector3(-3171.453, 1043.857, 20.863), width = 2, length = 2},
    [13] = {shopType = 'clothing', coords = vector3(-1100.959, 2710.211, 19.107), width = 2, length = 2},
    [14] = {shopType = 'clothing', coords = vector3(-1207.65, -1456.88, 5.3784737586975), width = 2, length = 2},
    [15] = {shopType = 'clothing', coords = vector3(121.76, -224.6, 54.56), width = 2, length = 2},
    [16] = {shopType = 'barber', coords = vector3(-814.3, -183.8, 37.6), width = 2, length = 2},
    [17] = {shopType = 'barber', coords = vector3(136.8, -1708.4, 29.3), width = 2, length = 2},
    [18] = {shopType = 'barber', coords = vector3(-1282.6, -1116.8, 7.0), width = 2, length = 2},
    [19] = {shopType = 'barber', coords = vector3(1931.5, 3729.7, 32.8), width = 2, length = 2},
    [20] = {shopType = 'barber', coords = vector3(1212.8, -472.9, 66.2), width = 2, length = 2},
    [21] = {shopType = 'barber', coords = vector3(-32.9, -152.3, 57.1), width = 2, length = 2},
    [22] = {shopType = 'barber', coords = vector3(-278.1, 6228.5, 31.7), width = 2, length = 2}
}

-- set isGang to true if the requiredJob is a gang
Config.ClothingRooms = {
    [1] = {requiredJob = 'police', isGang = false, coords = vector3(452.60095, -997.0809, 31.709304), width = 3, length = 3, cameraLocation = vector4(451.97, -997.02, 31.70, 292.21)},
    [2] = {requiredJob = 'ambulance', isGang = false, coords = vector3(305.10, -600.50, 43.27), width = 2, length = 2, cameraLocation = vector4(305.10, -600.50, 43.27, 263.70)}, -- Right double door in Hospital Map that is on QBCore GitHub
    [3] = {requiredJob = 'police', isGang = false, coords = vector3(471.54, -978.91, 23.94), width = 3, length = 3, cameraLocation = vector4(471.54, -978.91, 23.94, 22.56)},
    [4] = {requiredJob = 'bean', isGang = false, coords = vector3(117.86, -1043.93, 29.30), width = 3, length = 3, cameraLocation = vector4(117.86, -1043.93, 29.30, 205.14)},

}
--- BlackListing Clothes 
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

Config.Outfits = {
    ['police'] = {
        -- Job
        ['male'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Cadet',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 540, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                }
                
            },
			-- Gender
            [1] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Cadet Solo',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                }
                
            },
			-- Gender
            [2] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 0} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer Sweater Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 543, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                },
                
            },
			-- Gender
            [6] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer II Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 1} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer II Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 1} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Officer II Sweater Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 543, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 1} -- Decals
                    }
                },
                
            },
            -- Gender
            [9] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Corporal Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 3} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Corporal Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 3} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Corporal Sweater Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 543, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 3} -- Decals
                    }
                },
                
            },
            -- Gender
            [13] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Sergeant Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 2} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Sergeant Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 2} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Sergeant Sweater Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 543, texture = 3}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 2} -- Decals
                    }
                },
                
            },
            -- Gender
            [17] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Lieutenant Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 13}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 0} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Lieutenant Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 13}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Lieutenant Tied Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 540, texture = 12}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 0} -- Decals
                    }
                },
                
            },
            [21] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'LSPD Captain Short Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 11, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 542, texture = 14}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 144, texture = 5} -- Decals
                    }
                },
                [2] = {
                    -- Outfits
                    outfitLabel = 'LSPD Captain Long Sleeve',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 541, texture = 14}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 5} -- Decals
                    }
                },
                [3] = {
                    -- Outfits
                    outfitLabel = 'LSPD Captain Tied Uniform',
                    outfitData = {
                        ["pants"] = {item = 265, texture = 1}, -- Pants
                        ["arms"] = {item = 1, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 244, texture = 0}, -- T Shirt
                        ["vest"] = {item = 40, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 540, texture = 13}, -- Jacket
                        ["shoes"] = {item = 220, texture = 0}, -- Shoes
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = 278, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["decals"] = {item = 147, texture = 5} -- Decals
                    }
                },
                
            },
        },
        ['female'] = {
            -- Gender
            -- Gender
            [1] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Constable',
                    outfitData = {
                        ["pants"] = {item = 0, texture = 0}, -- Pants
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 16, texture = 0}, -- T Shirt
                        ["vest"] = {item = 1, texture = 0}, -- Body Vest
                        ["torso2"] = {item = 3, texture = 0}, -- Jacket
                        ["shoes"] = {item = 133, texture = 0}, -- Shoes
                        ["accessory"] = {item = 1, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["hat"] = {item = 14, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 8, texture = 0}, -- Mask
                        ["decals"] = {item = 1, texture = 0} -- Decals
                    }
                }
            },
			-- Gender
            [2] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'MO19',
                    outfitData = {
                        ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                    }
                }
            },
			-- Gender
            [3] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'mo7',
                    outfitData = {
                        ["pants"] = {item = 135, texture = 1}, -- Pants
                        ["arms"] = {item = 213, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
                        ["vest"] = {item = 17, texture = 2}, -- Body Vest
                        ["torso2"] = {item = 327, texture = 8}, -- Jacket
                        ["shoes"] = {item = 52, texture = 0}, -- Shoes
                        ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                        ["hat"] = {item = 149, texture = 0}, -- Hat
                        ["glass"] = {item = 0, texture = 0}, -- Glasses
                        ["mask"] = {item = 35, texture = 0} -- Mask
                    }
                }
            }
        }
    },
    ['realestate'] = {
        -- Job
        ['male'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [1] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [2] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [3] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [4] = {
                -- Grade Level
                [1] = {
                    -- Outfits
                    outfitLabel = 'Short Sleeve',
                    outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            }
        },
        ['female'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
            -- Gender
            [1] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [2] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [3] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            },
			-- Gender
            [4] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Worker',
                    outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                    }
                }
            }
        }
    },
    ['ambulance'] = {
        -- Job
        ['male'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Paramedic',
                    outfitData = {
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 65, texture = 1}, -- Jackets
                        ["pants"] = {item = 21, texture = 0}, -- Pants
                        ["shoes"] = {item = 63, texture = 0}, -- Shoes
                        ["vest"] = {item = 0, texture = 0}, -- Body Vest
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = -1, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                    }
                }
            },
            [1] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Doctor',
                    outfitData = {
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 65, texture = 3}, -- Jackets
                        ["pants"] = {item = 21, texture = 0}, -- Pants
                        ["shoes"] = {item = 63, texture = 0}, -- Shoes
                        ["vest"] = {item = 0, texture = 0}, -- Body Vest
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = -1, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                    }
                }
            },
            [2] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Sr.Doctor',
                    outfitData = {
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 65, texture = 6}, -- Jackets
                        ["pants"] = {item = 21, texture = 0}, -- Pants
                        ["shoes"] = {item = 63, texture = 0}, -- Shoes
                        ["vest"] = {item = 0, texture = 0}, -- Body Vest
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = -1, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                    }
                }
            },
            [3] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'CMO',
                    outfitData = {
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 65, texture = 7}, -- Jackets
                        ["pants"] = {item = 21, texture = 0}, -- Pants
                        ["shoes"] = {item = 63, texture = 0}, -- Shoes
                        ["vest"] = {item = 0, texture = 0}, -- Body Vest
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                        ["glass"] = {item = -1, texture = 0}, -- Glasses
                        ["mask"] = {item = 0, texture = 0}, -- Mask
                        ["accessory"] = {item = -1, texture = 0}, -- Neck Accessory
                        ["bag"] = {item = 0, texture = 0}, -- Bag
                    }
                }
            }
        },
        ['female'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Paramedic',
                    outfitData = {
                        ["arms"] = {item = 6, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 585, texture = 0}, -- Jackets
                        ["pants"] = {item = 251, texture = 0}, -- Pants
                        ["shoes"] = {item = 133, texture = 0}, -- Shoes
                        ["mask"] = {item = 8, texture = 0}, -- Mask
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                    }
                }
            },
            [1] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Doctor',
                    outfitData = {
                        ["arms"] = {item = 6, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 585, texture = 0}, -- Jackets
                        ["pants"] = {item = 251, texture = 0}, -- Pants
                        ["shoes"] = {item = 133, texture = 0}, -- Shoes
                        ["mask"] = {item = 8, texture = 0}, -- Mask
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                    }
                }
            },
            [2] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Sr.Doctor',
                    outfitData = {
                        ["arms"] = {item = 6, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 585, texture = 0}, -- Jackets
                        ["pants"] = {item = 251, texture = 0}, -- Pants
                        ["shoes"] = {item = 133, texture = 0}, -- Shoes
                        ["mask"] = {item = 8, texture = 0}, -- Mask
                        ["hat"] = {item = -1, texture = 0}, -- Hat
                    }
                }
            }
        }
    },
    ['bean'] = {
        -- Job
        ['male'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Barista',
                    outfitData = {
                        ["arms"] = {item = 0, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 796, texture = 0}, -- Jackets

                    }
                }
            },
        },    
        ['female'] = {
            -- Gender
            [0] = {
                -- Grade Level
                [1] = {
                    outfitLabel = 'Barista',
                    outfitData = {
                        ["arms"] = {item = 6, texture = 0}, -- Arms
                        ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                        ["torso2"] = {item = 585, texture = 0}, -- Jackets

                    }
                }
            },
        }
    }
}
