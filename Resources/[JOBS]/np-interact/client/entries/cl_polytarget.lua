local Entries = {}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'bar:grabDrink' },
    data = {
        {
            id = "bar:grabDrink",
            label = "Grab Drink",
            icon = "circle",
            event = "np-interact:grabDrink"
        }
    },
    options = {
        distance = { radius = 2.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'bar:openFridge' },
    data = {
        {
            id = "bar:openFridge",
            label = "Open Fridge",
            icon = "circle",
            event = "np-interact:openFridge"
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:chargeCustomer' },
  data = {
      {
          id = "tbar:chargeCustomer",
          label = "Charge Customer",
          icon = "dollar-sign",
          event = "mizrp-tavern:peekAction",
          parameters = { action = "chargeCustomer" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:getBag' },
  data = {
      {
          id = "tbar:getBag",
          label = "Grab Bag",
          icon = "circle",
          event = "mizrp-tavern:peekAction",
          parameters = { action = "getBag" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'polytarget',
  group = { 'tbar:craftToxicMenu' },
  data = {
      {
          id = "tbar:craftToxicMenu",
          label = "Be Toxic",
          icon = "circle",
          event = "mizrp-tavern:peekAction",
          parameters = { action = "craftToxicMenu" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'townhall:gavel' },
    data = {
        {
            id = "townhall:gavel",
            label = "Use Gavel",
            icon = "circle",
            event = "mizrp-gov:gavel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}


Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'officer_sign_in' },
    data = {
        {
            id = "officer_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "officer" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'ems_sign_in' },
    data = {
        {
            id = "ems_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "ems" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'ems_volunteer_sign_in' },
    data = {
        {
            id = "ems_volunteer_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "ems_volunteer" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'fire_dept_sign_in' },
    data = {
        {
            id = "fire_dept_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "fire_dept" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'public_services_sign_in' },
    data = {
        {
            id = "public_services_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "public_services" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'driving_instructor_sign_in' },
    data = {
        {
            id = "driving_instructor_sign_in",
            label = "Duty Action",
            icon = "circle",
            event = "mizrp-signin:peekAction",
            parameters = { name = "driving_instructor" }
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'mizrp-jail:prison_services' },
    data = {
        {
            id = "prison_services",
            label = "Prison Services",
            icon = "circle",
            event = "mizrp-jail:services",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

-- // Stores // --

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target1' },
    data = {
        {
            id = "store_safe_target1",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_1",
            parameters = {}
        },
        {
            id = "store_safe_target1s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_1",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target2' },
    data = {
        {
            id = "store_safe_target2",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_2",
            parameters = {}
        },
        {
            id = "store_safe_target2s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_2",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target3' },
    data = {
        {
            id = "store_safe_target3",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_3",
            parameters = {}
        },
        {
            id = "store_safe_target3s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_3",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target4' },
    data = {
        {
            id = "store_safe_target4",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_4",
            parameters = {}
        },
        {
            id = "store_safe_target4s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_4",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target5' },
    data = {
        {
            id = "store_safe_target5",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_5",
            parameters = {}
        },
        {
            id = "store_safe_target5s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_5",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target6' },
    data = {
        {
            id = "store_safe_target6",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_6",
            parameters = {}
        },
        {
            id = "store_safe_target6s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_6",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target7' },
    data = {
        {
            id = "store_safe_target7",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_7",
            parameters = {}
        },
        {
            id = "store_safe_target7s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_7",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target8' },
    data = {
        {
            id = "store_safe_target8",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_8",
            parameters = {}
        },
        {
            id = "store_safe_target8s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_8",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target9' },
    data = {
        {
            id = "store_safe_target9",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_9",
            parameters = {}
        },
        {
            id = "store_safe_target9s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_9",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target10' },
    data = {
        {
            id = "store_safe_target10",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_10",
            parameters = {}
        },
        {
            id = "store_safe_target10s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_10",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target11' },
    data = {
        {
            id = "store_safe_target11",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_11",
            parameters = {}
        },
        {
            id = "store_safe_target11s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_11",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target12' },
    data = {
        {
            id = "store_safe_target12",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_12",
            parameters = {}
        },
        {
            id = "store_safe_target12s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_12",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target13' },
    data = {
        {
            id = "store_safe_target13",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_13",
            parameters = {}
        },
        {
            id = "store_safe_target13s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_13",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target14' },
    data = {
        {
            id = "store_safe_target14",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_14",
            parameters = {}
        },
        {
            id = "store_safe_target14s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_14",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target15' },
    data = {
        {
            id = "store_safe_target15",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_15",
            parameters = {}
        },
        {
            id = "store_safe_target15s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_15",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target16' },
    data = {
        {
            id = "store_safe_target16",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_16",
            parameters = {}
        },
        {
            id = "store_safe_target16s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_16",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target17' },
    data = {
        {
            id = "store_safe_target17",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_17",
            parameters = {}
        },
        {
            id = "store_safe_target17s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_17",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target18' },
    data = {
        {
            id = "store_safe_target18",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_18",
            parameters = {}
        },
        {
            id = "store_safe_target18s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_18",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target19' },
    data = {
        {
            id = "store_safe_target19",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_19",
            parameters = {}
        },
        {
            id = "store_safe_target19s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_19",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Entries[#Entries + 1] = {
    type = 'polytarget',
    group = { 'store_safe_target20' },
    data = {
        {
            id = "store_safe_target20",
            label = "Open Case",
            icon = "fas fa-box-open",
            event = "aspect-storerob:stores:store_openSafe_20",
            parameters = {}
        },
        {
            id = "store_safe_target20s",
            label = "Crack Case",
            icon = "fas fa-user-secret",
            event = "aspect-storerob:stores:store_safe_20",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 1.5 },
        
    }
} 

Citizen.CreateThread(function()
    for _, entry in ipairs(Entries) do
        if entry.type == 'flag' then
            AddPeekEntryByFlag(entry.group, entry.data, entry.options)
        elseif entry.type == 'model' then
            AddPeekEntryByModel(entry.group, entry.data, entry.options)
        elseif entry.type == 'entity' then
            AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
        elseif entry.type == 'polytarget' then
            AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
        end
    end
end)