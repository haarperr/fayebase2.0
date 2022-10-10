local PedEntries = MenuEntries['peds']

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-escort",
        title = "Escort",
        icon = "#general-escort",
        event = "escortPlayer"
    },
    isEnabled = function(pEntity, pContext)
        return not IsDisabled() and not isEscorting and pEntity and pContext.flags['isPlayer']
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-cuffActions",
        title = "Cuff Actions",
        icon = "#cuffs",
    },
    subMenus = {"civuncuffmenu", "cuffs:remmask", "civcuffmenu"}, 
    isEnabled = function(pEntity, pContext)
        return (not isHandcuffed and not isHandcuffedAndWalking and (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["np-inventory"]:hasEnoughOfItem("cuffs", 1, false)) and not exports['np-death']:GetDeathStatus())
    end
}

PedEntries[#PedEntries+1] = {
    data = {
      id = "medic",
      title = "Medical",
      icon = "#medic",
    },
    subMenus = {"medic:revive", "medic:heal", "medic:heal2", "general:putinvehicle", "general:unseatnearest" },
    isEnabled = function()  
      return (exports["isPed"]:isPed("myJob") == 'ems' or exports["isPed"]:isPed("myJob") == 'doc' and not exports['np-death']:GetDeathStatus())
  end
  }

PedEntries[#PedEntries+1] = {
  data = {
    id = "police-actions",
    title = "Police Actions",
    icon = "#police-action",
  },
  subMenus = {'police:search', 'police:remmask', 'police:checkBank', 'police:checkLicenses', 'police:gsr', 'police:dnaSwab'},
  isEnabled = function()  
    return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'doc' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' and not exports['np-death']:GetDeathStatus())
end
}

PedEntries[#PedEntries+1] = {
    data = {
      id = "steal",
      title = "Steal",
      icon = "#steal",
      event = "police:stealrob"
    },
    isEnabled = function(pEntity, pContext)
      return not IsDisabled() and not (isPolice or isDoc) and pEntity and pContext.flags['isPlayer'] and (isPersonBeingHeldUp(pEntity) or pContext.flags['isDead'])
    end
}

-- EMS SHTUFF

MenuItems['medic:revive'] = {
    data = {
        id = "medic:revive",
        title = "Revive",
        icon = "#medic-revive",
        event = "np-ems:emsRevive"
    }
  }

  MenuItems['medic:heal'] = {
    data = {
        id = "medic:heal",
        title = "Apply Bandages",
        icon = "#medic-heal",
        event = "np-ems:smallheal"
    }
  }

  MenuItems['medic:heal2'] = {
    data = {
        id = "medic:heal2",
        title = "Apply Medkit",
        icon = "#medic-heal",
        event = "np-ems:bigheal"
    }
  }

-- PD SHTUFF

MenuItems['police:checkLicenses'] = {
  data = {
      id = "police:checkLicenses",
      title = "Check Licenses",
      icon = "#police-check-licenses",
      event = "police:checkLicenses"
  }
}

MenuItems['police:search'] = {
    data = {
        id = "peds-search",
        title = "Search Person",
        icon = "#cuffs-check-inventory",
        event = "police:checkInventory"
    }
  }

MenuItems['cuffs:remmask'] = {
    data = {
        id = "cuffs:remmask",
        title = "Remove Mask Hat",
        icon = "#cuffs-remove-mask",
        event = "police:remmask"
    }
}

MenuItems['civcuffmenu'] = {
    data = {
        id = "civ:cuffFromMenu",
        title = "Cuff",
        icon = "#cuffs-cuff",
        event = "civ:cuffFromMenu"
    }
}

MenuItems['civuncuffmenu'] = {
    data = {
        id = "civ:uncuffFromMenu",
        title = "Cuff",
        icon = "#cuffs-uncuff",
        event = "civ:uncuffFromMenu"
    }
}

MenuItems['police:dnaSwab'] = {
    data = {
        id = "police:dnaSwab",
        icon = "#police-action-dna-swab",
        title = "DNA Swab",
        event = "evidence:dnaSwab"
    },
    isEnabled = function(pEntity, pContext)
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger') and not exports['np-death']:GetDeathStatus()
    end
}

MenuItems['police:checkBank'] = {
    data = {
        id = "police:checkBank",
        icon = "#police-check-bank",
        title = "Check Bank",
        event = "police:checkBank"
    },
    isEnabled = function(pEntity, pContext)
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger') and not exports['np-death']:GetDeathStatus()
    end
}

MenuItems['civ:cuffFromMenu'] = {
    data = {
        id = "civ:cuffFromMen",
        icon = "#cuffs-cuff",
        title = "Cuff",
        event = "civ:cuffFromMenu"
    },
    isEnabled = function()
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger') and not exports['np-death']:GetDeathStatus()
    end
}

MenuItems['police:uncuffMenu'] = {
    data = {
        id = "police:uncuffMenu",
        icon = "#cuffs-uncuff",
        title = "Cuff",
        event = "police:uncuffMenu"
    },
    isEnabled = function()
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger') and not exports['np-death']:GetDeathStatus()
    end
}

MenuItems['police:gsr'] = {
    data = {
        id = "police:gsr",
        icon = "#police-action-gsr",
        title = "Check GSR",
        event = "police:gsr"
    },
    isEnabled = function()
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'ranger') and not exports['np-death']:GetDeathStatus()
    end
}

MenuItems['police:panicbutton'] = {
    data = {
        id = "police:panicbutton",
        icon = "#police-action-panic",
        title = "Panic Button",
        event = "police:policePanic"
    },
    isEnabled = function()
        return (exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger' and exports['np-death']:GetDeathStatus())
    end
}